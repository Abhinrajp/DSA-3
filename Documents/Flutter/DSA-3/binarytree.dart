class Node {
  int? data;
  Node? left;
  Node? right;
  Node(this.data);
}

class Binarytree {
  Node? root = null;
  void add(int data) {
    Node? newnode = Node(data);
    if (root == null) {
      root = newnode;
      return;
    }
    Node? current = root;
    while (true) {
      if (data < current!.data!) {
        if (current.left == null) {
          current.left = newnode;
          return;
        }
        current = current.left;
      } else {
        if (current.right == null) {
          current.right = newnode;
          return;
        }
        current = current.right;
      }
    }
  }

  void displayTree() {
    _inOrderTraversal(root);
  }

  void _inOrderTraversal(Node? node) {
    if (node != null) {
      _inOrderTraversal(node.left);
      print(node.data);
      _inOrderTraversal(node.right);
    }
  }

  bool contain(int data) {
    Node? currrent = root;

    while (currrent != null) {
      if (data < currrent.data!) {
        currrent = currrent.left;
      } else if (data > currrent.data!) {
        currrent = currrent.right;
      } else {
        return true;
      }
    }
    return false;
  }

  dltnode(Node? root, int data) {
    if (root == null) {
      return;
    }
    if (data < root.data!) {
      root.left = dltnode(root.left, data);
    } else if (data > root.data!) {
      root.right = dltnode(root.right, data);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      Node? minval = min(root.right!);
      root.data = minval!.data;
      root.right = dltnode(root.right, minval.data!);
    }
    return root;
  }

  Node? min(Node node) {
    while (node.left != null) {
      node = node.left!;
    }
    return node;
  }

  dlt(int data) {
    root = dltnode(root, data);
  }
}

main() {
  Binarytree binarytree = Binarytree();
  binarytree.add(80);
  binarytree.add(40);
  binarytree.add(20);
  binarytree.add(60);
  binarytree.add(10);
  binarytree.add(30);
  binarytree.displayTree();
  print(binarytree.contain(90));
  binarytree.dlt(30);
  print('deleted a node');
  binarytree.displayTree();
}
