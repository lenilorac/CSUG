#include <iostream> 
#include <algorithm> 

#define SIZE 256


struct Node 
{ 
	int key; 
	// each node having a parent node array and child node array
	struct Node *p[SIZE] = {}, *c[SIZE] = {}; 
}; 

// Utility function creates a new binary tree node with given key 
Node * newNode(int k) 
{
	Node *temp = new Node; 
	temp->key = k; 
	temp->p[SIZE] = {};
	temp->c[SIZE] = {};
	return temp; 
}; 

int * findPath(Node *root, vector<int> &path, int k);
int findLCADAG(Node* root, Node* n1, Node* n2);
int findLCA(Node *root, Node n1, Node n2);
