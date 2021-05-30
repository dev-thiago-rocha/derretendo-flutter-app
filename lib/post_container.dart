import 'package:flutter/material.dart';
import 'package:quitanda_do_seu_joao/models/post_model.dart';

final TextStyle style = TextStyle(
    fontFamily: 'Montserrat', fontSize: 16.0, fontWeight: FontWeight.w500);

class PostContainer extends StatelessWidget {
  final PostModel post;

  PostContainer(this.post);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
              child: Text(post.title,
                  style: style.copyWith(color: Colors.white, fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("post criado por : @" + post.creationUserName,
                    style: style.copyWith(
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 90,
                  child: Text(post.description,
                      style: style.copyWith(
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 40,
                  child: Text(post.link,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: style.copyWith(
                        color: Colors.lime,
                      )),
                ),
                Text(
                    "data da postagem : " +
                        post.creationDateTime.toString().substring(0, 10),
                    style: style.copyWith(
                      color: Colors.white,
                    )),
                Text(
                    "preço : R\$ " + post.price.toString().replaceAll(".", ","),
                    style: style.copyWith(
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
