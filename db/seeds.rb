Member.create!([
  {name: "Tom Hanks", address: "1 Forest Street, Beverly Hills CA 90210", phone: "(310) 555-6677", email: "thanks@gmail.com", password_digest: "$2a$10$.duNQuUMZxnuBG9E.PQtGONQsejVA1ENq7IInmgGbVlOC5HC3nbAC", volunteer: false, admin: false},
  {name: "Morgan Freeman", address: "10 Pearly Gates Way, Beverly Hills, CA 90210", phone: "(310) 555-1111", email: "morgan@gmail.com", password_digest: "$2a$10$IpQxl/SGEzK/7csujS95Zux1ia24h9oOnqSc0pZwn1WOB3ZRtwbBO", volunteer: false, admin: false},
  {name: "Michael Gallipo", address: "100 Winkley Farm Lane, Rochester, NH 03867", phone: "(603) 531-9707", email: "deviljmg@yahoo.com", password_digest: "$2a$10$Mf2vv1ujZps44D/J05VNFupJBvzuq4Yzf0mAQIrZ2T/hZdJfy9HhK", volunteer: false, admin: true}
])

Production.create!([
  {title: "Seize The King", synopsis_short: "Full-throttle reinterpretation of Shakespeare's Richard III. With England's throne empty, Richard knocks down threats to his rule, fueling his insatiable ambition and paranoia.", synopsis_long: nil, image_small: nil, image_large: "https://m99hcb.media.zestyio.com/STK-artstix-1100x400-2.91e4652ca57ce9ccaded162182778c38.jpg"},
  {title: "Aladdin", synopsis_short: "In the middle-eastern town of Agrabah, Princess Jasmine is feeling hemmed in by her father’s desire to find her a royal groom. When Jasmine sneaks out of the palace incognito, she forms an instant connection with Aladdin, a charming street urchin and reformed thief.", synopsis_long: nil, image_small: nil, image_large: "http://jillscabanastories.files.wordpress.com/2013/07/disney-fantasy-0218zy_0360ms.jpg"},
  {title: "Phantom of the Opera", synopsis_short: "Deformed since birth, a bitter man known only as the Phantom lives in the sewers underneath the Paris Opera House. He falls in love with the obscure chorus singer Christine, and privately tutors her while terrorizing the rest of the opera house and demanding Christine be given lead roles.", synopsis_long: nil, image_small: nil, image_large: "https://astridstark1.files.wordpress.com/2011/12/phantom-doc.jpg"}
])
Professional.create!([
  {name: "Jaime Castañeda", bio: "He has directed productions for Dallas Theater Center, Atlantic Theater Company, Cleveland Play House, The Old Globe, Perseverance Theatre, Kitchen Dog and American Theater Company. Mr. Castañeda has developed new plays with the O’Neill, Rattlestick Theater, Portland Center Stage, Denver Center Theater Company, The Kennedy Center and the Atlantic Theater Company, where he spent five seasons as Artistic Associate. He is a Drama League fellow and has received the Princess Grace Award and the TCG New Generations Grant. M.F.A. in Directing from University of Texas at Austin.", image: "http://s3.amazonaws.com/ataimages/crops/40516/Jaime_Castaneda_web_medium_cropped.jpg"},
  {name: "Julian Parker", bio: "Julian is an actor, writer, and producer and a south side of Chicago native. He is currently a recurring co-star on The Chi. He can also be seen on Chicago P.D. (2014) and Chicago Fire (2017).", image: "https://d1we5yax8fyln6.cloudfront.net/sites/stage32.com/files/imagecache/gallery_image/assets/head-shot/37888/head-shot_37888_1328988266.jpg"},
  {name: "Saidah Arrika Ekulona", bio: "Saidah Arrika Ekulona is an award-winning theatre, television and film actress. She's originated roles on Broadway, Off-Broadway, in regional theatres and international theatres, and originated the role of Mama Nadi in the Pulitzer Prize winning play Ruined, for which she won an Obie Award, Lucille Lortel Award, Jeff Award, Audelco Award and the Black Theatre Alliance Award. Saidah received her BA from Albright College and her MFA from University of Minnesota.", image: "https://images-na.ssl-images-amazon.com/images/M/MV5BNWQ5MjFmNzktODYwZS00OGZmLTg0MjUtMmIwODQ3NjE0NmIwXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_UX214_CR0,0,214,317_AL_.jpg"},
  {name: "Jenapher Zheng", bio: "Jenapher Zheng is an actor, writer, and multi-disciplinary artist based in Los Angeles. She is an exuberant personality with an insatiable desire to create. At CalArts, she trained intensively in various schools of acting- along with vocal and physical technique- to earn her conservatory degree. Her skills include singing, playing the piano, physical theatre, character voices, speaking fluent Mandarin, and playing video games.", image: "https://s3.amazonaws.com/FringeUser/u_63355_i_5849709.jpg"},
  {name: "Luis Vega", bio: "Luis Vega is an actor and writer, known for Another Earth (2011), Emoticon ;) (2014) and After the Parade (2009).", image: "http://ia.media-imdb.com/images/M/MV5BMTk2NjkyNTIyN15BMl5BanBnXkFtZTcwNjgxNDkwOQ@@._V1_SX214_CR0,0,214,317_AL_.jpg"},
  {name: "Casey Nicholaw", bio: "(born 1962) is an American theatre director, choreographer and performer. He has been nominated for Tony Awards for directing and choreographing The Drowsy Chaperone (2006), The Book of Mormon (2011), Something Rotten! (2015), and Mean Girls (2018) and for choreographing Monty Python's Spamalot (2005) and Aladdin (2014), winning for his co-direction of The Book of Mormon with Trey Parker. He also was nominated for the Drama Desk Awards for Outstanding Direction and Choreography for The Drowsy Chaperone (2006) and Something Rotten! (2015) and for Outstanding Choreography for Spamalot (2005).", image: "http://t2conline.com/wp-content/uploads/2018/03/Casey-Nicholaw-Headshot-201x300.jpg"},
  {name: "Chad Beguelin", bio: "(born September 24, 1969) is an American playwright and four-time Tony Award nominee. He wrote the book for Disney's Aladdin, as well as additional lyrics for the score. He was nominated for Best Original Book and Best Original Score for Aladdin. He is also known for his collaborations with composer Matthew Sklar, having written the lyrics and co-written the book for the Broadway musical The Wedding Singer and the lyrics for the Broadway musical Elf the Musical. Beguelin was nominated for two Tony Awards for his work on The Wedding Singer, as well as a Drama Desk Award for Outstanding Lyrics.", image: "http://4.bp.blogspot.com/-P3Hxja4JfII/T_U1PapQI7I/AAAAAAAAAQc/6pENjEDKNPo/s1600/Chad+Beguelin.jpg"},
  {name: "Telly Leung", bio: "Telly Leung's Broadway credits include In Transit, Allegiance (with George Takei and Lea Salonga), Godspell, Rent (final Broadway company), Wicked (Boq, Chicago company), Pacific Overtures and Flower Drum Song. He's been seen off-Broadway in MTC’s The World of Extreme Happiness. On TV, he's been seen as Wes the Warbler on Glee, Odd Mom Out, Deadbeat and Law and Order: Criminal Intent. He has released two solo albums: I’ll Cover You (2012) and Songs for You (2016). Telly has a BFA from Carnegie Mellon University.", image: "https://d2npu017ljjude.cloudfront.net/images/regular-43/w360/99282-17.jpg"},
  {name: "Arielle Jacobs", bio: "Arielle is so excited to be in Agrabah! She’s previously starred on Broadway in In The Heights (Nina) from creator Lin-Manuel Miranda and in Wicked (Nessa). Regionally, she's appeared in Rent (Mimi); Into the Woods (The Bakers Wife). Arielle originated the roles of Farhad in Farhad, or the Secret of Being off-Broadway, Gabriella in the national tour of Disney’s High School Musical, Nina in the 1st National Tour of In The Heights, and Jasmine in the Australian company of Disney’s Aladdin. She’s performed on many of America’s greatest stages including Lincoln Center in NYC and The Kennedy Center in Washington, DC. Her debut solo album A Leap in the Dark came out this year.", image: "https://d2npu017ljjude.cloudfront.net/images/regular-43/w360/99283-15.jpeg"},
  {name: "Major Attaway", bio: "Major Attaway makes his Broadway debut as Genie in Aladdin. His regional credits include Hot Mikado (Mikado), Stagger Lee (T-Bone), Hands on a Hardbody (Ronald), Little Shop of Horrors (A2), Ain’t Misbehavin (Ken) and Frosty the Snowman (Frosty).", image: "https://d2npu017ljjude.cloudfront.net/images/regular-43/w360/99291-15.jpeg"},
  {name: "Jonathan Freeman", bio: "Jonathan Freeman was born on February 5, 1950 in Cleveland, Ohio, USA. He is an actor, known for Aladdin (1992), The Producers (2005) and Shining Time Station (1989).", image: "https://m.media-amazon.com/images/M/MV5BMTgxODM4ODU4MF5BMl5BanBnXkFtZTcwODE2MjIyOA@@._V1_UX214_CR0,0,214,317_AL_.jpg"},
  {name: "Don Darryl Rivera", bio: "Don Darryl Rivera was born in Seattle, Washington. He graduated from Cornish College of the Arts with a BFA in Theatre.", image: "https://m.media-amazon.com/images/M/MV5BZjM4MTI3MTItNmY3Zi00NjQzLThjMjctMGQyMDdiOTMzMDVkXkEyXkFqcGdeQXVyOTIyNzM5MDY@._V1_UY317_CR20,0,214,317_AL_.jpg"},
  {name: "Steel Burkhardt", bio: "Steel Burkhardt began a four-year journey with Hair as a Tribe member in the 2007 Central Park concerts, followed by the 2008 full production in the park, the 2009 Broadway revival and 2010 London transfer. He moved up to the leading role of Berger in the show’s national tour and returned to Broadway in the summer of 2011. Burkhardt’s stage credits also include Jesus Christ Superstar and Kiss Me, Kate.", image: "http://static.playbill.com/dims4/default/0342f51/2147483647/resize/1200x627/quality/90/?url=http%3A%2F%2Fstatic.playbill.com%2Fa5%2F52%2Fa3df82254d789eb48773555da804%2Fhairreopen30.jpg"},
  {name: "Brian Gonzales", bio: "Brian Gonzales is an actor, known for Law & Order (1990) and The Four Players (2013).", image: "http://dallas.culturemap.com/thumbnail/800x600/photos/2016/08/08/Actor-Brian-Gonzales_102041.jpg"},
  {name: "JC Montgomery", bio: "J.C. Montgomery is an actor, known for The Producers (2005), The Blacklist (2013) and Gypsy (2017).", image: "https://m.media-amazon.com/images/M/MV5BMTg1NTQwMzMyOF5BMl5BanBnXkFtZTgwNTgyODkwNDE@._V1_UX214_CR0,0,214,317_AL_.jpg"},
  {name: "Brad Weinstock", bio: "Broadway debut! National Tours: Jersey Boys as Frankie Valli, Wicked as Boq. Broadway in Chicago: 25th Annual Putnam County Spelling Bee as Chip. Regional: Sweeney Todd as Geva, Hero as Asolo Rep. Northwestern graduate. He was also a contestant on Who Wants to Be a Millionaire. Thanks to Mom, Dad, and to Bug, who is a wish granted.", image: "http://www.aladdinthemusical.com/themes/uploads/BradWeinstock.jpg"}
])
Role.create!([
  {production_id: 1, professional_id: 1, title: "Director"},
  {production_id: 1, professional_id: 2, title: "Writer"},
  {production_id: 1, professional_id: 3, title: "Actor"},
  {production_id: 1, professional_id: 4, title: "Actor"},
  {production_id: 1, professional_id: 5, title: "Actor"}
])
Performance.create!([
  {production_id: 1, date: "2018-10-18", time: "2000-01-01 03:00:00", tickets_available: 250, tickets_sold: 0, ticket_price: "50.0"},
  {production_id: 1, date: "2018-10-19", time: "2000-01-01 03:00:00", tickets_available: 250, tickets_sold: 0, ticket_price: "50.0"},
  {production_id: 1, date: "2018-10-20", time: "2000-01-01 03:00:00", tickets_available: 250, tickets_sold: 0, ticket_price: "50.0"}
])