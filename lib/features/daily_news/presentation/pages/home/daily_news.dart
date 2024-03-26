import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News Jancoq',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              final article = state.articles![index];
              return ArticleWidget(
                article: article,
              );
            },
          );
        } else if (state is RemoteArticlesError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
