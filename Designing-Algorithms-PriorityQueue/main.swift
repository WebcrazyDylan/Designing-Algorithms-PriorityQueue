//
//  main.swift
//  Designing-Algorithms-PriorityQueue
//
//  Created by Dylan Park on 2021-08-07.
//

import Foundation

public protocol Queue {
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

struct PriorityQueue<Element: Equatable>: Queue {

  private var heap: Heap<Element>
  var isEmpty: Bool {
    heap.isEmpty
  }
  var peek: Element? {
    heap.peek()
  }

  init(sort: @escaping (Element, Element) -> Bool,
       elements: [Element] = []) {
    heap = Heap(sort: sort, elements: elements)
  }

  mutating func enqueue(_ element: Element) -> Bool {
    heap.insert(element)
    return true
  }

  mutating func dequeue() -> Element? {
    heap.remove()
  }
}

var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])
print("PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])")
while !priorityQueue.isEmpty {
  print(priorityQueue.dequeue()!)
}

 priorityQueue = PriorityQueue(sort: <, elements: [1,12,3,4,1,6,8,7])
print("PriorityQueue(sort: <, elements: [1,12,3,4,1,6,8,7])")
while !priorityQueue.isEmpty {
  print(priorityQueue.dequeue()!)
}

