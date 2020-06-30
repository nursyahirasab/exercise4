const db = require("../functions/database");

async function setupDatabase(req, res, next) {
  // To delete all the collections
  const collections = ["quotes"];
  collections.forEach(async (collection) => await deleteCollection(collection));

addDocuments("quotes", [
   { data: "Someday is not a day of the week", like: 3, dislike: 2},
   { data: "Your time is limited, so don't waste it living someone else's life.", like: 2, dislike: 2},
   { data: "Everyone lives by selling something", like: 1, dislike: 0},
]);
  res.send("Setting Up Database.... Done ");
}

async function deleteCollection(collection) {
  const cref = db.firestore.collection(collection);
  const docs = await cref.listDocuments();
  docs.forEach((doc) => doc.delete());
}

function addDocuments(collection, docs) {
  docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;