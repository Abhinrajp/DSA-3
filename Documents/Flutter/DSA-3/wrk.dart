class Graphlast {
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

  showeddge(int vertex) {
    if (graph.containsKey(vertex)) {
      print(graph[vertex]);
    }
  }

  dis() {
    graph.forEach((key, value) {
      print('${key} : ${value}');
    });
  }

  dfs(int vertex) {
    if (graph.containsKey(vertex)) {
      Set<int> vis = {};
      dfshlp(vertex, vis);
      print(vis);
    }
  }

  dfshlp(int vertex, Set<int> vist) {
    vist.add(vertex);
    for (var element in graph[vertex]!) {
      if (!vist.contains(element)) {
        dfshlp(element, vist);
      }
    }
  }
}

main() {
  Graphlast graphlast = Graphlast();
  graphlast.insert(10, 14);
  graphlast.insert(10, 15);
  graphlast.insert(19, 10);
  graphlast.insert(10, 17);
  graphlast.insert(10, 18);
  graphlast.insert(17, 19);
  graphlast.insert(17, 20);
  graphlast.showeddge(10);
  graphlast.dis();
  graphlast.dfs(10);
}
