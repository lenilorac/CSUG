#pragma once
#include <iostream> 
#include <vector> 

using namespace std;

// A Binary Tree node 
struct Node 
{ 
	int key; 
	struct Node *left, *right; 
}; 

bool findPath(Node *root, vector<int> &path, int k);

int findLCA(Node *root, int n1, int n2);

