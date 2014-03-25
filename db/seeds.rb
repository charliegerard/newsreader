User.destroy_all
Topic.destroy_all
Source.destroy_all
Article.destroy_all

u1 = User.create(:first_name => "Charlie", :last_name => "Gerard", :email_address => "annecharlotte.gerard@gmail.com", :photo => "http://m.c.lnkd.licdn.com/mpr/mpr/shrink_200_200/p/4/005/048/342/17f9554.jpg", :password => "test")

t1 = Topic.create(:name => "Technology")
t2 = Topic.create(:name => "Design")
t3 = Topic.create(:name => "Fashion")
t4 = Topic.create(:name => "Music")
t5 = Topic.create(:name => "Photography")
t6 = Topic.create(:name => "Business")
t7 = Topic.create(:name => "Gaming")
t8 = Topic.create(:name => "Marketing")


#Tech
s1 = Source.create(:name => "The Verge", :url => "http://www.theverge.com")
s2 = Source.create(:name => "Engadget", :url => "http://www.engadget.com")
s3 = Source.create(:name => "Mashable", :url => "http://mashable.com/")
s4 = Source.create(:name => "TechCrunch", :url => "http://techcrunch.com/")
s5 = Source.create(:name => "ReadWrite", :url => "http://readwrite.com")

#Design
s6 = Source.create(:name => "DesignMilk", :url => "http://design-milk.com/")
s7 = Source.create(:name => "Cool Hunting", :url => "http://www.coolhunting.com/")
s8 = Source.create(:name => "CoDesign", :url => "http://fastcodesign.com/")
s9 = Source.create(:name => "Yanko Design", :url => "http://www.yankodesign.com")
s10 = Source.create(:name => "Dezeen", :url => "http://www.dezeen.com/")

#Fashion
s11 = Source.create(:name => "Style Bubble", :url => "http://www.stylebubble.co.uk")
s12 = Source.create(:name => "Hype Beast", :url => "http://hypebeast.com")
s13 = Source.create(:name => "Garance Dore", :url => "http://garancedore.fr/en/")
s14 = Source.create(:name => "Official Lookbook", :url => "http://lookbook.nu")
s15 = Source.create(:name => "The Blonde Salad", :url => "http://www.theblondsalad.com")

#Music
s16 = Source.create(:name => "Stereogum", :url => "http://www.stereogum.com")
s17 = Source.create(:name => "Pitchfork", :url => "http://pitchfork.com")
s18 = Source.create(:name => "RollingStone", :url => "http://www.rollingstone.com/")
s19 = Source.create(:name => "MTV", :url => "http://www.mtv.com/")
s20 = Source.create(:name => "InTheMix", :url => "http://www.inthemix.com.au/")

#Photography
s21 = Source.create(:name => "500px", :url => "http://www.500px.com/")
s22 = Source.create(:name => "The Impossible Cool", :url => "http://www.theimpossiblecool.tumblr.com/")
s23 = Source.create(:name => "National Geographic", :url => "http://www.nationalgeographic.com/")
s24 = Source.create(:name => "The Big Picture", :url => "http://www.boston.com/bigpicture")
s25 = Source.create(:name => "ShootTokyo", :url => "http://www.shoottokyo.com/")

#Business
s26 = Source.create(:name => "Seth Godin", :url => "http://www.sethgodin.com/")
s27 = Source.create(:name => "Business Insider", :url => "http://www.businessinsider.com/")
s28 = Source.create(:name => "Inc", :url => "http://www.inc.com/")
s29 = Source.create(:name => "Venture Beat", :url => "http://www.venturebeat.com/")
s30 = Source.create(:name => "The Economist", :url => "http://www.economist.com/")

#Gaming
s31 = Source.create(:name => "Polygon", :url => "http://www.polygon.com/")
s32 = Source.create(:name => "Joystiq", :url => "http://www.joystiq.com/")
s33 = Source.create(:name => "Game Life", :url => "http://www.wired.com/gamelife")
s34 = Source.create(:name => "Indie Games", :url => "http://www.indiegames.com/")
s35 = Source.create(:name => "Playstation Blog", :url => "http://www.blog.us.playstation.com/")

#Marketing
s36 = Source.create(:name => "The KISSmetrics marketing blog", :url => "http://www.kissmetrics.com/")
s37 = Source.create(:name => "HubSpot", :url => "http://www.hubspot.com/")
s38 = Source.create(:name => "MOZBlog", :url => "http://www.moz.com/blog")
s39 = Source.create(:name => "Marketing Mag", :url => "http://www.marketingmag.com.au/")
s40 = Source.create(:name => "B&T", :url => "http://www.bandt.com/")

a1 = Article.create(:title => "The Black Keys detail new album", :copy => "The Black Keys have revealed the title and release date of their new LP: Turn Blue, their eighth studio album, will be released on May 13th. And they shared that information in an incredibly cryptic and absurd way – through a Mike Tyson tweet. Turn Blue, the boxing legend wrote on Friday, along with a link to a kooky, David Lynch-ian Youtube video of a hypnotherapist and a spinning pink record.", :image => "http://assets-s3.rollingstone.com/assets/images/story/the-black-keys-detail-new-album-turn-blue-through-mike-tyson-tweet-20140321/1000x600/20140321-blackkeys-x600-1395439282.jpg", :author => "Ryan Reed", :url => "http://www.rollingstone.com/music/news/the-black-keys-detail-new-album-turn-blue-through-mike-tyson-tweet-20140321")
a2 = Article.create(:title => "A RENOVATED ATTIC APARTMENT IN PRAGUE", :copy => "OOOOX handled the renovation of an attic apartment located in Prague, Czech Republic that was no easy task. The old building uncovered many hidden issues as the reconstruction went on and also, it’s not always easy to get a modern look in an old, period building. The result is a clean, contemporary space named the Grey Loft.", :image => "http://3.design-milk.com/images/2014/03/Grey-Loft-OOOOX-1.jpg", :url => "http://design-milk.com/renovated-attic-apartment-prague/")

u1.sources << [s1]

t1.sources << [s1, s2, s3, s4, s5]
t2.sources << [s6, s7, s8, s9, s10]
t3.sources << [s11, s12, s13, s14, s15]
t4.sources << [s16, s17, s18, s19, s20]
t5.sources << [s21, s22, s23, s24, s25]
t6.sources << [s26, s27, s28, s29, s30]
t7.sources << [s31, s32, s33, s34, s35]
t8.sources << [s36, s37, s38, s39, s40]

s18.articles << a1
s6.articles << a2