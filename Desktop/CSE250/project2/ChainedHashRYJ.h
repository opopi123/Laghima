// Roy Joo and Luey Laport CSE250 Project 2
#ifndef MORPHED_VALLI_H_
#define MORPHED_VALLI_H_

#include "DList.h"
#include <vector>
using std::vector;

template <typename I>
class MorphedValli
{
public:
	class iterator
	{
		typename DList<I>::iterator list_iter;

		iterator(const typename DList<I>::iterator& l_iter)
			:list_iter(l_iter){}

		friend class MorphedValli<I>;

	public:
		iterator(const iterator& other)
			:list_iter(other.list_iter){}

		iterator& operator=(const iterator& rhs)
		{
			list_iter = rhs.list_iter;
			return *this;
		}

		I& operator*() const
		{
			return *list_iter;
		}

		iterator& operator++()
		{
			++list_iter;
			return *this;
		}

		iterator operator++(int)
		{
			iterator oldMe = *this;
			list_iter++;
			return oldMe;
		}

		bool operator==(const iterator& rhs) const
		{
			return list_iter == rhs.list_iter;
		}

		bool operator!=(const iterator& rhs) const
		{
			return list_iter != rhs.list_iter;
		}
	};

private:
	DList<I> list;
	vector<iterator> vec;
	size_t n, buckets;

public:
	explicit MorphedValli(size_t buckets = 10000)
		:list(DList<I>())
		,vec(vector<iterator>())
		,n(0), buckets(buckets)
	{
		for (size_t bucket = 0; bucket < buckets; bucket++)
		{
			iterator iter = iterator(list.insert(list.iend(), I()));
			vec.push_back(iter);
		}
		vec.push_back(iterator(list.iend()));
	}

	~MorphedValli(){
			}

	iterator begin() const
	{
		return iterator(list.begin());
	}

	iterator end() const
	{
		return iterator(list.iend());
	}

	iterator find( I& item) 
	{
		size_t h = hash(item) % buckets;
		for (iterator iter = vec[h]; iter != vec[h+1]; iter++){
			if (*iter == item)	
			return iter;}
	return end();
	}

	iterator insert( I& item)
	{
		size_t h = hash(item) % buckets;
		for (iterator iter = vec[h]; iter != vec[h+1]; iter++)
			if (*iter == item)
				return iter;
		++n;
		return iterator(list.insert(vec[h+1].list_iter, item));
	}

	size_t size() const
	{
		return n;
	}

	size_t const hash(string s)
	{	size_t hash = 0;
		for (size_t i = 0; i < s.size(); ++i){
		hash = hash * 31 + s[i];}
		return hash;
	}
	size_t  hash( I& item)
	{
		size_t h= hash(item.str());
		return h;	
	}
		
	bool empty() const
	{
		return size() == 0;
	}

	string str() const
	{
		return list.toString();
	}
};

#endif
