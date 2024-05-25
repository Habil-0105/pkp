class Url {
  static const baseURL = "https://jsonplaceholder.typicode.com/";

  static String post(PostEndpoint postEndpoint, {int? id}) {
    switch (postEndpoint) {
      case PostEndpoint.create || PostEndpoint.read:
        return "posts";
      case PostEndpoint.update || PostEndpoint.delete:
        return "posts/$id";
    }
  }
}

enum PostEndpoint { create, read, update, delete }