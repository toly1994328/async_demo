import 'package:flutter/material.dart';

import '../model/github_repository.dart';

class GithubRepositoryPanel extends StatelessWidget {
  final List<GithubRepository> githubRepositories;

  const GithubRepositoryPanel({Key? key,required this.githubRepositories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: _buildItemByIndex, separatorBuilder: (_,index)=>Divider(), itemCount: githubRepositories.length);
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    GithubRepository repository = githubRepositories[index];
    String info = repository.description.isEmpty?'暂无简介':repository.description;
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(repository.userAvatarUrl),
      ),
      title: Row(
        children: [
          Text(repository.name),
          const Spacer(),
          const Icon(Icons.star,size: 18,),
          const SizedBox(width: 4,),
          Text('${repository.stargazersCount}',style: const TextStyle(fontSize: 12),),
          const SizedBox(width: 4,),
          const Icon(Icons.cable,size: 18,),
          const SizedBox(width: 4,),
          Text('${repository.forksCount}',style: const TextStyle(fontSize: 12),),
        ],
      ),
      subtitle: Text(info),

    );
  }
}
