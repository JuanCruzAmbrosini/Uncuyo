import unittest
from binarytree import BinaryTree, insert, search, access, delete, traverseBreadFirst
import mylinkedlist as linkedlist

class TestBinaryTree(unittest.TestCase):
	def test_insert_first_element(self):
		bt = BinaryTree()
		insert(bt, 'comienzo', 1)
		self.assertEqual(access(bt, 1), 'comienzo')

	def test_insert_element_check_order(self):
		strings = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
		keys = [10, 5, 20, 8, 13, 18, 22, 2, 9, 40, 21, 11, 7, 3, 1]
		bt = BinaryTree()
		for i in range(15):
			insert(bt, strings[i], keys[i])
		self.assertEqual(access(bt, 21), "b")

	def test_delete_leaf_check_order(self):
		strings = ["1", "2", "3", "4", "5", "6"]
		keys = [10, 5, 20, 8, 13, 22]
		bt = BinaryTree()
		for i in range(6):
			insert(bt, strings[i], keys[i])
		delete(bt, "2")
		self.assertEqual(bt.root.leftnode.key, 8)

	def test_delete_element(self):
		strings = ["1", "2", "3", "4", "5", "6"]
		keys = [10, 5, 20, 8, 13, 22]
		bt = BinaryTree()
		for i in range(6):
			insert(bt, strings[i], keys[i])
		delete(bt, "5")
		self.assertEqual(search(bt, "5"), None)

	def test_delete_inexistent_element(self):
		strings = ["1", "2", "3", "4", "5", "6"]
		keys = [10, 5, 20, 8, 13, 22]
		bt = BinaryTree()
		for i in range(6):
			insert(bt, strings[i], keys[i])
		res = delete(bt, 54)
		self.assertEqual(res, None)

	def test_delete_root(self):
		strings = ["uno", "dos", "tres"]
		keys = [10, 5, 20]
		bt = BinaryTree()
		for i in range(3):
			insert(bt, strings[i], keys[i])
		delete(bt, "uno")
		self.assertEqual(bt.root.value, "tres")

	def test_search(self):
		strings = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
		keys = [10, 5, 20, 8, 13, 18, 22, 2, 9, 40, 21, 11, 7, 3, 1]
		bt = BinaryTree()
		for i in range(15):
			insert(bt, strings[i], keys[i])
		self.assertEqual(search(bt, "7"), 22)

	def test_search_inexistent(self):
		strings = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
		keys = [10, 5, 20, 8, 13, 18, 22, 2, 9, 40, 21, 11, 7, 3, 1]
		bt = BinaryTree()
		for i in range(15):
			insert(bt, strings[i], keys[i])
		self.assertEqual(search(bt, "g"), None)

	def test_access_inexistent_element(self):
		strings = ["1", "2", "3", "4", "5", "6"]
		keys = [10, 5, 20, 8, 13, 22]
		bt = BinaryTree()
		for i in range(6):
			insert(bt, strings[i], keys[i])
		self.assertEqual(access(bt, 55), None)

	def test_traverse_bfs(self):
		strings = [50, 20, 80, 10, 40, 70, 60]
		keys = [50, 20, 80, 10, 40, 70, 60]
		bt = BinaryTree()
		for i in range(7):
			insert(bt, strings[i], keys[i])
		L = traverseBreadFirst(bt)
		l = []
		for i in range(linkedlist.lengthList(L)):
			l.append(linkedlist.access(L, i))
		self.assertEqual(l, [50, 20, 80, 10, 40, 70, 60])

if __name__ == '__main__':
	unittest.main(verbosity=2)