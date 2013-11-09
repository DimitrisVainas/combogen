# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# TRICKS
Trick.create(name: "Tornado Kick", difficulty: "FND", setup: "N/A")
Trick.create(name: "Cartwheel", difficulty: "FND", setup: "N/A")
Trick.create(name: "Hook", difficulty: "FND", setup: "N/A")
Trick.create(name: "Front Roll", difficulty: "FND", setup: "N/A")
Trick.create(name: "Back Roll", difficulty: "FND", setup: "N/A")
Trick.create(name: "540", difficulty: "A", setup: "Cheat")
Trick.create(name: "Pop 360", difficulty: "A", setup: "Pop")
Trick.create(name: "Aerial", difficulty: "A", setup: "N/A")
Trick.create(name: "Back Flip", difficulty: "A", setup: "N/A")
Trick.create(name: "Front Flip", difficulty: "A", setup: "N/A")
Trick.create(name: "Butterfly Kick", difficulty: "A", setup: "N/A")
Trick.create(name: "Kip Up", difficulty: "A", setup: "N/A")
Trick.create(name: "Feilong Kick", difficulty: "A", setup: "Pop")
Trick.create(name: "Au Batido", difficulty: "A", setup: "N/A")
Trick.create(name: "Cheat 720", difficulty: "B", setup: "Cheat")
Trick.create(name: "Aerial Switch", difficulty: "B", setup: "N/A")
Trick.create(name: "Butterfly Twist", difficulty: "B", setup: "N/A")
Trick.create(name: "Doubleleg", difficulty: "B", setup: "Pop")
Trick.create(name: "Pop 720", difficulty: "B", setup: "Pop")
Trick.create(name: "Flash Kick", difficulty: "B", setup: "N/A")
Trick.create(name: "Raiz", difficulty: "B", setup: "N/A")
Trick.create(name: "TD Raiz", difficulty: "B", setup: "N/A")
Trick.create(name: "Parafuso", difficulty: "B", setup: "Cheat")
Trick.create(name: "Gainerflash", difficulty: "B", setup: "Swing")
Trick.create(name: "Masterswipe", difficulty: "B", setup: "Master")
Trick.create(name: "Suicide Kip Up", difficulty: "B", setup: "N/A")
Trick.create(name: "Backside 900", difficulty: "B", setup: "Pop")
Trick.create(name: "Sideswipe", difficulty: "C", setup: "N/A")
Trick.create(name: "Hypertwist", difficulty: "C", setup: "N/A")
Trick.create(name: "Pop 900", difficulty: "C", setup: "Pop")
Trick.create(name: "Backside 1080", difficulty: "C", setup: "Pop")
Trick.create(name: "Jackknife", difficulty: "C", setup: "Cheat")
Trick.create(name: "Corkscrew", difficulty: "C", setup: "Swing")
Trick.create(name: "Cheat 900", difficulty: "C", setup: "Cheat")
Trick.create(name: "Aerial Twist", difficulty: "C", setup: "N/A")
Trick.create(name: "Fulltwist", difficulty: "C", setup: "N/A")
Trick.create(name: "Terada Grab", difficulty: "C", setup: "N/A")
Trick.create(name: "X-Out", difficulty: "C", setup: "N/A")
Trick.create(name: "Grandmasterswipe", difficulty: "C", setup: "Master")
Trick.create(name: "Pop 1080", difficulty: "D", setup: "Pop")
Trick.create(name: "Doubleleg Hook", difficulty: "D", setup: "Pop")
Trick.create(name: "Cheat 720 Twist", difficulty: "D", setup: "N/A")
Trick.create(name: "Boxcutter", difficulty: "D", setup: "Swing")
Trick.create(name: "Paraknife", difficulty: "D", setup: "Cheat")
Trick.create(name: "Hyperhook", difficulty: "D", setup: "N/A")
Trick.create(name: "Cork Doubleleg", difficulty: "D", setup: "Swing")
Trick.create(name: "Full Doubleleg", difficulty: "D", setup: "N/A")
Trick.create(name: "Fulltwist Round", difficulty: "D", setup: "N/A")
Trick.create(name: "Full Doubleleg", difficulty: "D", setup: "N/A")
Trick.create(name: "Snapuswipe", difficulty: "E", setup: "N/A")
Trick.create(name: "Doublefull", difficulty: "E", setup: "N/A")
Trick.create(name: "Cheat 900 Double", difficulty: "E", setup: "Cheat")
Trick.create(name: "Cheat Hyper 900", difficulty: "E", setup: "Cheat")
Trick.create(name: "Cheat 1080", difficulty: "E", setup: "Cheat")
Trick.create(name: "Double B-Twist", difficulty: "E", setup: "N/A")
Trick.create(name: "Doubleleg Twist", difficulty: "E", setup: "Pop")
Trick.create(name: "Masterscoot", difficulty: "EX", setup: "N/A")
Trick.create(name: "Scoot", difficulty: "EX", setup: "N/A")
Trick.create(name: "Front Sweep", difficulty: "EX", setup: "N/A")
Trick.create(name: "Back Sweep", difficulty: "EX", setup: "N/A")
Trick.create(name: "Narabong", difficulty: "EX", setup: "N/A")


# COMBOS
Combo.create(:no_tricks => 4)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Cheat 900").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Hook").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("TD Raiz").id )
Element.create(:combo_id => Combo.last.id, :index => 4, :trick_id => Trick.find_by_name("Flash Kick").id )

Combo.create(:no_tricks => 5)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Hook").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Masterscoot").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Gainerflash").id )
Element.create(:combo_id => Combo.last.id, :index => 4, :trick_id => Trick.find_by_name("Backside 900").id )
Element.create(:combo_id => Combo.last.id, :index => 5, :trick_id => Trick.find_by_name("Doubleleg").id )

Combo.create(:no_tricks => 3)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("540").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Cartwheel").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Full Doubleleg").id )

Combo.create(:no_tricks => 6)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Cartwheel").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Front Flip").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Front Roll").id )
Element.create(:combo_id => Combo.last.id, :index => 4, :trick_id => Trick.find_by_name("Back Sweep").id )
Element.create(:combo_id => Combo.last.id, :index => 5, :trick_id => Trick.find_by_name("Scoot").id )
Element.create(:combo_id => Combo.last.id, :index => 6, :trick_id => Trick.find_by_name("Cork Doubleleg").id )

Combo.create(:no_tricks => 3)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Butterfly Twist").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Cheat 900").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Doubleleg").id )

Combo.create(:no_tricks => 4)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Hook").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Cartwheel").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Fulltwist").id )
Element.create(:combo_id => Combo.last.id, :index => 4, :trick_id => Trick.find_by_name("Gainerflash").id )

Combo.create(:no_tricks => 3)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Cheat 900").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Hook").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Jackknife").id )

Combo.create(:no_tricks => 4)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Paraknife").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Raiz").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Cork Doubleleg").id )
Element.create(:combo_id => Combo.last.id, :index => 4, :trick_id => Trick.find_by_name("Backside 1080").id )

Combo.create(:no_tricks => 6)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Hook").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Raiz").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Cheat 900").id )
Element.create(:combo_id => Combo.last.id, :index => 4, :trick_id => Trick.find_by_name("Hook").id )
Element.create(:combo_id => Combo.last.id, :index => 5, :trick_id => Trick.find_by_name("Cartwheel").id )
Element.create(:combo_id => Combo.last.id, :index => 6, :trick_id => Trick.find_by_name("Doublefull").id )

Combo.create(:no_tricks => 3)
Element.create(:combo_id => Combo.last.id, :index => 1, :trick_id => Trick.find_by_name("Jackknife").id )
Element.create(:combo_id => Combo.last.id, :index => 2, :trick_id => Trick.find_by_name("Aerial").id )
Element.create(:combo_id => Combo.last.id, :index => 3, :trick_id => Trick.find_by_name("Grandmasterswipe").id )


# ADMIN
Tricker.create(:name => "Dimitris", :email => "dimitris@tricking.gr", :password => "k0dik0ls", :admin => true )
