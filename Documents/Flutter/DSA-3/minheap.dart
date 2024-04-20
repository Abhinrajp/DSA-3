class Minheappppp {
  List<int> heap = [];
  insert(List<int> arr) {
    for (var i = 0; i < arr.length; i++) {
      heap.add(arr[i]);
      heapfy();
    }
  }

  add(int data) {
    heap.add(data);
    heapfy();
  }

  heapfy() {
    int currentindex = heap.length - 1;
    while (currentindex > 0) {
      int parentindex = (currentindex - 1) ~/ 2;
      if (heap[currentindex] < heap[parentindex]) {
        swap(currentindex, parentindex);
        currentindex = parentindex;
      } else {
        break;
      }
    }
  }

  swap(int currentindex, int parentindex) {
    int temp = heap[currentindex];
    heap[currentindex] = heap[parentindex];
    heap[parentindex] = temp;
  }

  rmeove() {
    int minval = heap.removeLast();
    heap[0] = minval;
    heapfyrem(0);
  }

  heapfyrem(int curentindex) {
    int minval = curentindex;
    int left = 2 * curentindex + 1;
    int right = 2 * curentindex + 2;
    if (left < heap.length && heap[left] < heap[minval]) {
      minval = left;
    }
    if (right < heap.length && heap[right] < heap[minval]) {
      minval = right;
    }
    if (curentindex != minval) {
      swap(curentindex, minval);
      heapfyrem(minval);
    }
  }
}

main() {
  Minheappppp minheappppp = Minheappppp();
  List<int> arr = [80, 40, 60, 10, 50, 30];
  print(arr);
  print('after min heap');
  minheappppp.insert(arr);
  print(minheappppp.heap);
  minheappppp.add(55);
  print('afteer removing element');
  minheappppp.rmeove();
  print(minheappppp.heap);
}
