Movie.destroy_all

Movie.create!([
  {
    title: "The Batman",
    category: "Action",
    image: "https://wallpapercave.com/wp/wp11486956.jpg",
    year: 2022,
    rating: 8.5,
    trailer_id: "mqqft2x_Aa4",
    synopsis: "Ketika seorang pembunuh berantai sadis bernama The Riddler mulai menghabisi para pejabat elit Gotham dan meninggalkan teka-teki misterius, Batman terpaksa turun ke dunia bawah tanah Gotham untuk menyelidikinya.",
    is_popular: true
  },
  {
    title: "Spiderman: No Way Home",
    category: "Sci-Fi",
    image: "https://m.media-amazon.com/images/M/MV5BMmFiZGZjMmEtMTA0Ni00MzA2LTljMTYtZGI2MGJmZWYzZTQ2XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
    year: 2021,
    rating: 9.0,
    trailer_id: "JfVOs4VSpmA",
    synopsis: "Kekacauan hidup Peter Parker setelah identitas rahasianya dibongkar. Demi mengembalikan kehidupan normal, Peter meminta bantuan Doctor Strange, namun mantra tersebut justru merobek multiverse.",
    is_new: true,
    is_popular: false
  }
])

puts "Gas! Sukses memasukkan #{Movie.count} data film ke database! 🎬"