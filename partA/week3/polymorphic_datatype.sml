datatype 'a option = NONE | SOME of 'a

datatype b = int | string


datatype ('a, 'b) tree = Node of 'a * ('a, 'b) tree * ('a, 'b) tree
                       | Leaf of 'b


