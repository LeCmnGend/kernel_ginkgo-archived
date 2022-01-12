/* SPDX-License-Identifier: GPL-2.0 */
/*
 * include/linux/pagevec.h
 *
 * In many places it is efficient to batch an operation up against multiple
 * pages.  A pagevec is a multipage container which is used for that.
 */

#ifndef _LINUX_PAGEVEC_H
#define _LINUX_PAGEVEC_H

<<<<<<< HEAD
<<<<<<< HEAD
/* 15 pointers + header align the pagevec structure to a power of two */
#define PAGEVEC_SIZE	15
=======
/* 14 pointers + two long's align the pagevec structure to a power of two */
#define PAGEVEC_SIZE	14
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
/* 14 pointers + two long's align the pagevec structure to a power of two */
#define PAGEVEC_SIZE	14
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4

struct page;
struct address_space;

struct pagevec {
<<<<<<< HEAD
<<<<<<< HEAD
	unsigned char nr;
	bool cold;
	bool drained;
=======
	unsigned long nr;
	unsigned long cold;
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
	unsigned long nr;
	unsigned long cold;
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
	struct page *pages[PAGEVEC_SIZE];
};

void __pagevec_release(struct pagevec *pvec);
void __pagevec_lru_add(struct pagevec *pvec);
unsigned pagevec_lookup_entries(struct pagevec *pvec,
				struct address_space *mapping,
				pgoff_t start, unsigned nr_entries,
				pgoff_t *indices);
void pagevec_remove_exceptionals(struct pagevec *pvec);
unsigned pagevec_lookup_range(struct pagevec *pvec,
			      struct address_space *mapping,
			      pgoff_t *start, pgoff_t end);
static inline unsigned pagevec_lookup(struct pagevec *pvec,
				      struct address_space *mapping,
				      pgoff_t *start)
{
	return pagevec_lookup_range(pvec, mapping, start, (pgoff_t)-1);
}

unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
		struct address_space *mapping, pgoff_t *index, pgoff_t end,
		int tag);
unsigned pagevec_lookup_range_nr_tag(struct pagevec *pvec,
		struct address_space *mapping, pgoff_t *index, pgoff_t end,
		int tag, unsigned max_pages);
static inline unsigned pagevec_lookup_tag(struct pagevec *pvec,
		struct address_space *mapping, pgoff_t *index, int tag)
{
	return pagevec_lookup_range_tag(pvec, mapping, index, (pgoff_t)-1, tag);
}

static inline void pagevec_init(struct pagevec *pvec, int cold)
{
	pvec->nr = 0;
	pvec->cold = cold;
<<<<<<< HEAD
<<<<<<< HEAD
	pvec->drained = false;
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
}

static inline void pagevec_reinit(struct pagevec *pvec)
{
	pvec->nr = 0;
}

static inline unsigned pagevec_count(struct pagevec *pvec)
{
	return pvec->nr;
}

static inline unsigned pagevec_space(struct pagevec *pvec)
{
	return PAGEVEC_SIZE - pvec->nr;
}

/*
 * Add a page to a pagevec.  Returns the number of slots still available.
 */
static inline unsigned pagevec_add(struct pagevec *pvec, struct page *page)
{
	pvec->pages[pvec->nr++] = page;
	return pagevec_space(pvec);
}

static inline void pagevec_release(struct pagevec *pvec)
{
	if (pagevec_count(pvec))
		__pagevec_release(pvec);
}

#endif /* _LINUX_PAGEVEC_H */
