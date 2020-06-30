const functions = require("firebase-functions");
const express = require("express");
const app = express();


app.use(express.json());
app.use("/quotes", quoteRouter);

exports.api = functions.https.onRequest(app);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
  timeoutSeconds: 300,
});
