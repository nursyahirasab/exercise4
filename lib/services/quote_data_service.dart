import './rest_service.dart';
import '../models/quote_model.dart';

// QuoteDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// Todo: Modify this class accordingly. You want to add all CRUD operations that your app uses.
// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git

class QuoteDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final QuoteDataService _instance = QuoteDataService._constructor();
  factory QuoteDataService() {
    return _instance;
  }

  QuoteDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

  Future<List<Quote>> getAllQuotes() async {
    final listJson = await rest.get('quotes');

    return (listJson as List)
        .map((itemJson) => Quote.fromJson(itemJson))
        .toList();
  }

  // You may not need this REST call in your app. It is only for example here.
  Future deleteQuote({String id}) async {
    await rest.delete('quotes/$id');
  }

  // You may not need this REST call in your app. It is only for example here.
  Future<Quote> createQuote({Quote quote}) async {
    final json = await rest.post('quotes', data: quote);
    return Quote.fromJson(json);
  }

  // Todo: You may need to provide the REST calls for the followings:
  //        Get a quote for a given id
  Future<Quote> getQuote({String id}) async {
    final json = await rest.get('quotes/$id');
    return Quote.fromJson(json);
  }

  //        Update a quote for a given id
  Future<Quote> updateQuote({String id}) async {
    final json = await rest.patch('quotes/$id');
    return Quote.fromJson(json);
  }

  //        Vote a quote for like or dislike
  Future<Quote> voteQuote({String id, double percentage}) async {
    final json = await rest.patch('quotes/$id', data: {'vote': percentage});
    return Quote.fromJson(json);
  }

  //        Like or dislike a quote
  Future<Quote> likeQuote({String id, int like}) async {
    final json = await rest.patch('quotes/$id', data: {'like': like});
    return Quote.fromJson(json);
  }

  Future<Quote> dislikeQuote({String id, int dislike}) async {
    final json = await rest.patch('quotes/$id', data: {'dislike': dislike});
    return Quote.fromJson(json);
  }
} // class Quote
