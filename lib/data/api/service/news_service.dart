import 'package:dio/dio.dart';
import 'package:news_cleaan_arch_bloc/data/api/model/api_article_response.dart';
import 'package:news_cleaan_arch_bloc/data/api/model/api_sources_response.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_hot_news_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_source_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_source_news_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_top_head_line_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/search_body.dart';

class NewsService {
  static String mainUrl = "https://newsapi.org/v2/";
  static String apiKey = "5f3cc93ad2f14f35a501168c997d7b62";

  final Dio _dio = Dio();

  var getSourcesUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = "$mainUrl/everything";

  Future<ApiSourceResposeModel> getSource(GetSourceBody body) async {
    try {
      Response response =
          await _dio.get(getSourcesUrl, queryParameters: body.toApi());
      if (response.statusCode == 200) {
        return ApiSourceResposeModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ApiArticleResponseModel> getTopHeadLines(
      GetTopHeadLinesBody body) async {
    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: body.toApi());
      if (response.statusCode == 200) {
        return ApiArticleResponseModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ApiArticleResponseModel> search(SearchBody body) async {
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: body.toApi());
      if (response.statusCode == 200) {
        return ApiArticleResponseModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ApiArticleResponseModel> getHotNews(GetHotNewsBody body) async {
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: body.toApi());
      if (response.statusCode == 200) {
        return ApiArticleResponseModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ApiArticleResponseModel> getSourceNews(GetSourceNewsBody body) async {
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: body.toApi());
      if (response.statusCode == 200) {
        return ApiArticleResponseModel.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
  }
}
