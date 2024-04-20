class Graphh {
  Map<int, List<int>> graph = {};
  insert(int vertex, int edge, [bool isbi = false]) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isbi) {
      graph[edge]!.add(vertex);
    }
  }

  showedge(int vertex) {
    if (graph.containsKey(vertex)) {
      print(graph[vertex]);
    }
  }

  display() {
    graph.forEach((key, value) {
      print("${key} : ${value}");
    });
  }

  dfs(int vertex) {
    if (graph.containsKey(vertex)) {
      Set<int> res = {};
      dfshelper(vertex, res);
      print(res);
    }
  }

  dfshelper(int vertex, Set<int> res) {
    res.add(vertex);
    for (var verte in graph[vertex]!) {
      if (!res.contains(verte)) {
        dfshelper(verte, res);
      }
    }
  }
}

main() {
  Graphh graphh = Graphh();
  graphh.insert(10, 14);
  graphh.insert(10, 15);
  graphh.insert(19, 10);
  graphh.insert(10, 17);
  graphh.insert(10, 18);
  graphh.insert(17, 19);
  graphh.insert(17, 20);
  graphh.showedge(10);
  graphh.display();
  print(graphh.dfs(17));
}
