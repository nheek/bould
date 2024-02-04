import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
	type: 'content',
	// Type-check frontmatter using a schema
	schema: z.object({
		title: z.string(),
		description: z.string().optional(),
		category: z.string(),
		author: z.string(),
		// Transform string to Date object
		pubDate: z.coerce.date(),
		updatedDate: z.coerce.date().optional(),
		heroImage: z.string(),
		isHero: z.boolean().optional(),
		isSideHero1: z.boolean().optional(),
		isSideHero2: z.boolean().optional(),
	}),
});

export const collections = { blog };
