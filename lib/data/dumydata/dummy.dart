import '../models/book_model.dart';

const List<BookModel> allBooks =
[
  BookModel(
    id: '1',
    title: 'Atomic Habits',
    author: 'James Clear',
    cover: 'https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg',
    totalChapters: 5,
    category: 'Self Help',
    description:
        'Tiny changes, remarkable results. Learn how small daily habits lead to extraordinary success.',
    duration: Duration(hours: 5, minutes: 35),
    rating: 4.9,
    totalReviews: 5500,
    language: 'English'


  ),

  BookModel(
    id: '2',
    title: 'Deep Work',
    author: 'Cal Newport',
    cover: 'https://covers.openlibrary.org/b/isbn/9781455586691-L.jpg',
    totalChapters: 5,
    category: 'Productivity',
    description:
        'Discover strategies to improve focus and produce high-quality work without distractions.',
    duration: Duration(hours: 6, minutes: 10),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '3',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    cover: 'https://covers.openlibrary.org/b/isbn/9781612681139-L.jpg',
    totalChapters: 5,
    category: 'Finance',
    description:
        'A classic book that changes the way you think about money, investing, and financial freedom.',
    duration: Duration(hours: 6, minutes: 45),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '4',
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    cover: 'https://covers.openlibrary.org/b/isbn/9780857197689-L.jpg',
    totalChapters: 5,
    category: 'Finance',
    description:
        'Understand why people make financial decisions and how behavior matters more than knowledge.',
    duration: Duration(hours: 5, minutes: 50),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '5',
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    cover: 'https://covers.openlibrary.org/b/isbn/9780061122415-L.jpg',
    totalChapters: 5,
    category: 'Fiction',
    description:
        'A timeless story about following your dreams and discovering your personal legend.',
    duration: Duration(hours: 4, minutes: 20),
    rating: 4.6,
    totalReviews: 5500,
    language: 'English'
  ),
  BookModel(
    id: '6',
    title: 'The Mountain Is You',
    author: 'Brianna Wiest',
    cover: 'https://covers.openlibrary.org/b/isbn/9781949759228-L.jpg',
    totalChapters: 5,
    category: 'Self Help',
    description:
        'Learn how self-sabotage works and transform it into self-mastery.',
    duration: Duration(hours: 7, minutes: 10),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '7',
    title: 'Think Like a Monk',
    author: 'Jay Shetty',
    cover: 'https://covers.openlibrary.org/b/isbn/9781982134488-L.jpg',
    totalChapters: 5,
    category: 'Self Help',
    description:
        'Train your mind for peace and purpose using timeless monk wisdom.',
    duration: Duration(hours: 9, minutes: 15),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '8',
    title: 'The 5 AM Club',
    author: 'Robin Sharma',
    cover: 'https://covers.openlibrary.org/b/isbn/9781443456627-L.jpg',
    totalChapters: 3,
    category: 'Productivity',
    description:
        'Own your mornings to elevate productivity and personal growth.',
    duration: Duration(hours: 8, minutes: 5),
    rating: 4.6,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '9',
    title: 'Ikigai',
    author: 'Héctor García',
    cover: 'https://covers.openlibrary.org/b/isbn/9780143130727-L.jpg',
    totalChapters: 3,
    category: 'Lifestyle',
    description: 'Discover the Japanese secret to a long and meaningful life.',
    duration: Duration(hours: 5, minutes: 25),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '10',
    title: 'The Subtle Art of Not Giving a F*ck',
    author: 'Mark Manson',
    cover: 'https://covers.openlibrary.org/b/isbn/9780062457714-L.jpg',

    totalChapters: 3,
    category: 'Self Help',
    description:
        'A refreshing approach to living a better life by focusing on what truly matters.',
    duration: Duration(hours: 6, minutes: 35),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '11',
    title: 'The Silent Patient',
    author: 'Alex Michaelides',
    cover: 'https://covers.openlibrary.org/b/isbn/9781250301697-L.jpg',

    totalChapters: 3,
    category: 'Thriller',
    description:
        'A psychological thriller full of suspense and unexpected twists.',
    duration: Duration(hours: 8, minutes: 30),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '12',
    title: 'The Midnight Library',
    author: 'Matt Haig',
    cover: 'https://covers.openlibrary.org/b/isbn/9780525559474-L.jpg',

    totalChapters: 3,
    category: 'Fiction',
    description:
        'A magical library lets Nora explore the lives she could have lived.',
    duration: Duration(hours: 7, minutes: 45),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '13',
    title: 'Cant Hurt Me',
    author: 'David Goggins',
    cover: 'https://covers.openlibrary.org/b/isbn/9781544512273-L.jpg',

    totalChapters: 3,
    category: 'Motivation',
    description:
        'An inspiring memoir about discipline, resilience, and mental toughness.',
    duration: Duration(hours: 13, minutes: 10),
    rating: 4.9,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '14',
    title: 'The Power of Now',
    author: 'Eckhart Tolle',
    cover: 'https://covers.openlibrary.org/b/isbn/9781577314806-L.jpg',

    totalChapters: 3,
    category: 'Spirituality',
    description:
        'Learn to live fully in the present moment and free yourself from unnecessary suffering.',
    duration: Duration(hours: 7, minutes: 5),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '15',
    title: 'The Lean Startup',
    author: 'Eric Ries',
    cover: 'https://covers.openlibrary.org/b/isbn/9780307887894-L.jpg',

    totalChapters: 3,
    category: 'Business',
    description:
        'A practical guide for entrepreneurs to build successful startups.',
    duration: Duration(hours: 8, minutes: 20),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),
];
const List<BookModel> recommended =
[
  BookModel(
    id: '6',
    title: 'The Mountain Is You',
    author: 'Brianna Wiest',
    cover: 'https://covers.openlibrary.org/b/isbn/9781949759228-L.jpg',
    totalChapters: 3,
    category: 'Self Help',
    description:
        'Learn how self-sabotage works and transform it into self-mastery.',
    duration: Duration(hours: 7, minutes: 10),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '7',
    title: 'Think Like a Monk',
    author: 'Jay Shetty',
    cover: 'https://covers.openlibrary.org/b/isbn/9781982134488-L.jpg',
    totalChapters: 2,
    category: 'Self Help',
    description:
        'Train your mind for peace and purpose using timeless monk wisdom.',
    duration: Duration(hours: 9, minutes: 15),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '8',
    title: 'The 5 AM Club',
    author: 'Robin Sharma',
    cover: 'https://covers.openlibrary.org/b/isbn/9781443456627-L.jpg',
    totalChapters: 2,
    category: 'Productivity',
    description:
        'Own your mornings to elevate productivity and personal growth.',
    duration: Duration(hours: 8, minutes: 5),
    rating: 4.6,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '9',
    title: 'Ikigai',
    author: 'Héctor García',
    cover: 'https://covers.openlibrary.org/b/isbn/9780143130727-L.jpg',
    totalChapters: 2,
    category: 'Lifestyle',
    description: 'Discover the Japanese secret to a long and meaningful life.',
    duration: Duration(hours: 5, minutes: 25),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '10',
    title: 'The Subtle Art of Not Giving a F*ck',
    author: 'Mark Manson',
    cover: 'https://covers.openlibrary.org/b/isbn/9780062457714-L.jpg',

    totalChapters: 2,
    category: 'Self Help',
    description:
        'A refreshing approach to living a better life by focusing on what truly matters.',
    duration: Duration(hours: 6, minutes: 35),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '11',
    title: 'The Silent Patient',
    author: 'Alex Michaelides',
    cover: 'https://covers.openlibrary.org/b/isbn/9781250301697-L.jpg',

    totalChapters: 2,
    category: 'Thriller',
    description:
        'A psychological thriller full of suspense and unexpected twists.',
    duration: Duration(hours: 8, minutes: 30),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),


];
const List<BookModel> newReleases =
[
  BookModel(
    id: '6',
    title: 'The Mountain Is You',
    author: 'Brianna Wiest',
    cover: 'https://covers.openlibrary.org/b/isbn/9781949759228-L.jpg',
    totalChapters: 2,
    category: 'Self Help',
    description:
        'Learn how self-sabotage works and transform it into self-mastery.',
    duration: Duration(hours: 7, minutes: 10),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '7',
    title: 'Think Like a Monk',
    author: 'Jay Shetty',
    cover: 'https://covers.openlibrary.org/b/isbn/9781982134488-L.jpg',
    totalChapters: 2,
    category: 'Self Help',
    description:
        'Train your mind for peace and purpose using timeless monk wisdom.',
    duration: Duration(hours: 9, minutes: 15),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '8',
    title: 'The 5 AM Club',
    author: 'Robin Sharma',
    cover: 'https://covers.openlibrary.org/b/isbn/9781443456627-L.jpg',
    totalChapters: 2,
    category: 'Productivity',
    description:
        'Own your mornings to elevate productivity and personal growth.',
    duration: Duration(hours: 8, minutes: 5),
    rating: 4.6,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '9',
    title: 'Ikigai',
    author: 'Héctor García',
    cover: 'https://covers.openlibrary.org/b/isbn/9780143130727-L.jpg',
    totalChapters: 2,
    category: 'Lifestyle',
    description: 'Discover the Japanese secret to a long and meaningful life.',
    duration: Duration(hours: 5, minutes: 25),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '10',
    title: 'The Subtle Art of Not Giving a F*ck',
    author: 'Mark Manson',
    cover: 'https://covers.openlibrary.org/b/isbn/9780062457714-L.jpg',

    totalChapters: 2,
    category: 'Self Help',
    description:
        'A refreshing approach to living a better life by focusing on what truly matters.',
    duration: Duration(hours: 6, minutes: 35),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '11',
    title: 'The Silent Patient',
    author: 'Alex Michaelides',
    cover: 'https://covers.openlibrary.org/b/isbn/9781250301697-L.jpg',

    totalChapters: 2,
    category: 'Thriller',
    description:
        'A psychological thriller full of suspense and unexpected twists.',
    duration: Duration(hours: 8, minutes: 30),
    rating: 4.8,
    totalReviews: 5500,
    language: 'English'
  ),

  BookModel(
    id: '12',
    title: 'The Midnight Library',
    author: 'Matt Haig',
    cover: 'https://covers.openlibrary.org/b/isbn/9780525559474-L.jpg',

    totalChapters: 2,
    category: 'Fiction',
    description:
        'A magical library lets Nora explore the lives she could have lived.',
    duration: Duration(hours: 7, minutes: 45),
    rating: 4.7,
    totalReviews: 5500,
    language: 'English'
  ),

];
