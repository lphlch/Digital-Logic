#include <iostream>

using namespace std;
const int MAXSIZE = 100000;
struct BiTreeNode
{
	char name;
	int leftChild;
	int rightChild;
};
BiTreeNode biTreeNodes1[MAXSIZE];
BiTreeNode biTreeNodes2[MAXSIZE];

bool checkChild(BiTreeNode nodes1[], int nodeCount1, BiTreeNode nodes2[], int nodeCount2)
{
	for (int i = 0; i < nodeCount1; i++)
	{
		for (int j = 0; j < nodeCount2; j++)
		{
			if (nodes1[i].name == nodes2[j].name)
			{
				if (nodes1[nodes1[i].leftChild].name == nodes2[nodes2[j].leftChild].name)
				{
				}
			}
		}
	}
}
int main()
{
	int n1, n2;
	char c;
	int l, r;

	int nodeCount1 = 0;
	cin >> n1;
	while (true)
	{
		cin >> biTreeNodes1[nodeCount1].name;
		//Check the input, if is #, point to MAXSIZE.
		cin >> biTreeNodes1[nodeCount1].leftChild;
		if (cin.fail())
		{
			cin.clear();
			getchar();
			biTreeNodes1[nodeCount1].leftChild = MAXSIZE;
		}
		cin >> biTreeNodes1[nodeCount1].rightChild;
		if (cin.fail())
		{
			cin.clear();
			getchar();
			biTreeNodes1[nodeCount1].rightChild = MAXSIZE;
		}
		nodeCount1++;
	}

	int nodeCount2 = 0;
	cin >> n2;
	cin >> biTreeNodes2[nodeCount2].name;
	//Check the input, if is #, point to MAXSIZE.
	cin >> biTreeNodes2[nodeCount2].leftChild;
	if (cin.fail())
	{
		cin.clear();
		getchar();
		biTreeNodes2[nodeCount2].leftChild = MAXSIZE;
	}
	cin >> biTreeNodes2[nodeCount2].rightChild;
	if (cin.fail())
	{
		cin.clear();
		getchar();
		biTreeNodes2[nodeCount2].rightChild = MAXSIZE;
	}
	nodeCount2++;

	return 0;
}