//Datums for different companies that can be used by busy_space
/datum/lore/organization
	var/name = ""				// Organization's name
	var/short_name = ""			// Organization's shortname (NanoTrasen for "NanoTrasen Incorporated")
	var/acronym = ""			// Organization's acronym, e.g. 'NT' for NanoTrasen'.
	var/desc = ""				// One or two paragraph description of the organization, but only current stuff.  Currently unused.
	var/history = ""			// Historical discription of the organization's origins  Currently unused.
	var/work = ""				// Short description of their work, eg "an arms manufacturer"
	var/headquarters = ""		// Location of the organization's HQ.  Currently unused.
	var/motto = ""				// A motto/jingle/whatever, if they have one.  Currently unused.

	var/list/ship_prefixes = list()	//Some might have more than one! Like NanoTrasen. Value is the mission they perform, e.g. ("ABC" = "mission desc")
	var/list/ship_names = list(		//Names of spaceships.  This is a mostly generic list that all the other organizations inherit from if they don't have anything better.
		"Kestrel",
		"Beacon",
		"Signal",
		"Freedom",
		"Glory",
		"Axiom",
		"Eternal",
		"Harmony",
		"Light",
		"Discovery",
		"Endeavour",
		"Explorer",
		"Swift",
		"Dragonfly",
		"Ascendant",
		"Tenacious",
		"Pioneer",
		"Hawk",
		"Haste",
		"Radiant",
		"Luminous",
		"Princess of Sol",
		"King of the Mountain",
		"Words and Changes",
		"Katerina's Silhouette",
		"Castle of Water",
		"Jade Leviathan",
		"Sword of Destiny",
		"Ishtar's Grace"
		)
	var/list/destination_names = list()	//Names of static holdings that the organization's ships visit regularly.
	var/autogenerate_destination_names = TRUE

/datum/lore/organization/New()
	..()
	if(autogenerate_destination_names) // Lets pad out the destination names.
		var/i = rand(6, 10)
		var/list/star_names = list(
			"Sol", "Alpha Centauri", "Tau Ceti", "Zhu Que", "Oasis", "Vir", "Gavel", "Ganesha",
			"Saint Columbia", "Altair", "Sidhe", "New Ohio", "Parvati", "Mahi-Mahi", "Nyx", "New Seoul",
			"Kess-Gendar", "Raphael", "Phact", "Altair", "El", "Eutopia", "Qerr'valis", "Qerrna-Lakirr", "Rarkajar", "Thoth", "Jahan's Post", "Kauq'xum", "Silk", "New Singapore", "Stove", "Viola", "Love", "Isavau's Gamble" )
		var/list/destination_types = list("dockyard", "station", "vessel", "waystation", "telecommunications satellite", "spaceport", "anomaly", "colony", "outpost", "debris field", "asteroid base", "research facility", "corporate installation", "freeport")
		while(i)
			destination_names.Add("a [pick(destination_types)] in [pick(star_names)]")
			i--

//////////////////////////////////////////////////////////////////////////////////

// TSCs
/datum/lore/organization/tsc/nanotrasen
	name = "NanoTrasen Incorporated"
	short_name = "NanoTrasen"
	acronym = "NT"
	desc = "NanoTrasen is one of the foremost research and development companies in SolGov space. \
	Originally focused on consumer products, their swift move into the field of Phoron has lead to \
	them being the foremost experts on the substance and its uses. In the modern day, NanoTrasen prides \
	itself on being an early adopter to as many new technologies as possible, often offering the newest \
	products to their employees. In an effort to combat complaints about being 'guinea pigs', Nanotrasen \
	also offers one of the most comprehensive medical plans in SolGov space, up to and including cloning \
	and therapy.\
	<br><br>\
	NT's most well known products are its phoron based creations, especially those used in Cryotherapy. \
	It also boasts an prosthetic line, which is provided to its employees as needed, and is used as an incentive \
	for newly tested posibrains to remain with the company."
	history = "" // To be written someday.
	work = "research giant"
	headquarters = "Luna, Sol"
	motto = ""

	ship_prefixes = list("NSV" = "exploration", "NTV" = "hauling", "NDV" = "patrol", "NRV" = "emergency response", "NDV" = "asset protection")
	//Scientist naming scheme
	ship_names = list(
		"Bardeen",
		"Einstein",
		"Feynman",
		"Sagan",
		"Tyson",
		"Galilei",
		"Jans",
		"Fhriede",
		"Franklin",
		"Tesla",
		"Curie",
		"Darwin",
		"Newton",
		"Pasteur",
		"Bell",
		"Mendel",
		"Kepler",
		"Edision",
		"Cavendish",
		"Nye",
		"Hawking",
		"Aristotle",
		"Von Braun",
		"Kaku",
		"Oppenheimer",
		"Renwick",
		"Hubble",
		"Alcubierre",
		"Robineau",
		"Glass"
		)
	// Note that the current station being used will be pruned from this list upon being instantiated
	destination_names = list(
		"NSS Exodus in Nyx",
		"NCS Northern Star in Vir",
		"NLS Southern Cross in Vir",
		"NAS Vir Central Command",
		"a dockyard orbiting Sif",
		"an asteroid orbiting Kara",
		"an asteroid orbiting Rota",
		"Vir Interstellar Spaceport"
		)

/datum/lore/organization/tsc/nanotrasen/New()
	..()
	spawn(1) // BYOND shenanigans means using_map is not initialized yet.  Wait a tick.
		// Get rid of the current map from the list, so ships flying in don't say they're coming to the current map.
		var/string_to_test = "[using_map.station_name] in [using_map.starsys_name]"
		if(string_to_test in destination_names)
			destination_names.Remove(string_to_test)



/datum/lore/organization/tsc/hephaestus
	name = "Hephaestus Industries"
	short_name = "Hephaestus"
	acronym = "HI"
	desc = "Hephaestus Industries is the largest supplier of arms, ammunition, and small millitary vehicles in Sol space. \
	Hephaestus products have a reputation for reliability, and the corporation itself has a noted tendency to stay removed \
	from corporate politics. They enforce their neutrality with the help of a fairly large asset-protection contingent which \
	prevents any contracting polities from using their own materiel against them. SolGov itself is one of Hephaestus' largest \
	bulk contractors owing to the above factors."
	history = ""
	work = "arms manufacturer"
	headquarters = "Luna, Sol"
	motto = ""

	ship_prefixes = list("HTV" = "freight", "HLV" = "munitions resupply", "HDV" = "asset protection", "HDV" = "preemptive deployment")
	//War God/Soldier Theme
	ship_names = list(
		"Ares",
		"Athena",
		"Grant",
		"Custer",
		"Puller",
		"Nike",
		"Bellona",
		"Leonides",
		"Bast",
		"Jackson",
		"Lee",
		"Annan",
		"Chi Yu",
		"Shiva",
		"Tyr",
		"Nobunaga",
		"Xerxes",
		"Alexander",
		"McArthur",
		"Samson",
		"Oya",
		"Nemain",
		"Caesar",
		"Augustus",
		"Sekhmet",
		"Ku",
		"Indra",
		"Innana",
		"Ishtar",
		"Qamaits",
		"'Oro",
		)
	destination_names = list(
		"a SolGov dockyard on Luna",
		"a Fleet outpost in the Almach Rim",
		"a Fleet outpost on the Moghes border"
		)

/datum/lore/organization/tsc/vey_med
	name = "Vey-Medical" //The Wiki displays them as Vey-Medical.
	short_name = "Vey-Med"
	acronym = "VM"
	desc = "Vey-Med is one of the newer TSCs on the block and is notable for being largely owned and opperated by Skrell. \
	Despite the suspicion and prejudice leveled at them for their alien origin, Vey-Med has obtained market dominance in \
	the sale of medical equipment-- from surgical tools to large medical devices to the Oddyseus trauma response mecha \
	and everything in between. Their equipment tends to be top-of-the-line, most obviously shown by their incredibly \
	human-like FBP designs. Vey's rise to stardom came from their introduction of ressurective cloning, although in \
	recent years they've been forced to diversify as their patents expired and NanoTrasen-made medications became \
	essential to modern cloning."
	history = ""
	work = "medical equipment supplier"
	headquarters = "Toledo, New Ohio"
	motto = ""

	ship_prefixes = list("VTV" = "transportation", "VMV" = "medical resupply", "VSV" = "research mission", "VRV" = "emergency medical support")
	// Diona names
	ship_names = list(
		"Wind That Stirs The Waves",
		"Sustained Note Of Metal",
		"Bright Flash Reflecting Off Glass",
		"Veil Of Mist Concealing The Rock",
		"Thin Threads Intertwined",
		"Clouds Drifting Amid Storm",
		"Loud Note And Breaking",
		"Endless Vistas Expanding Before The Void",
		"Fire Blown Out By Wind",
		"Star That Fades From View",
		"Eyes Which Turn Inwards",
		"Joy Without Which The World Would Come Undone",
		"A Thousand Thousand Planets Dangling From Branches",
		"Light Streaming Through Interminable Branches",
		"Smoke Brought Up From A Terrible Fire",
		"Light of Qerr'Valis",
		"King Xae'uoque",
		"Memory of Kel'xi",
		"Xi'Kroo's Herald"
		)
	destination_names = list(
		"a research facility in Samsara",
		"a SDTF near Ue-Orsi",
		"a sapientarian mission in the Almach Rim"
		)

/datum/lore/organization/tsc/zeng_hu
	name = "Zeng-Hu pharmaceuticals"
	short_name = "Zeng-Hu"
	acronym = "ZH"
	desc = "Zeng-Hu is an old TSC, based in the Sol system. Until the discovery of Phoron, Zeng-Hu maintained a stranglehold \
	on the market for medications, and many household names are patentted by Zeng-Hu-- Bicaridyne, Dylovene, Tricordrizine, \
	and Dexalin all came from a Zeng-Hu medical laboratory. Zeng-Hu's fortunes have been in decline as Nanotrasen's near monopoly \
	on phoron research cuts into their R&D and Vey-Med's superior medical equipment effectively decimated their own equipment \
	interests. The three-way rivalry between these companies for dominance in the medical field is well-known and a matter of \
	constant economic speculation."
	history = ""
	work = "pharmaceuticals company"
	headquarters = "Earth, Sol"
	motto = ""

	ship_prefixes = list("ZTV" = "transportation", "ZMV" = "medical resupply")
	destination_names = list()

/datum/lore/organization/tsc/ward_takahashi
	name = "Ward-Takahashi General Manufacturing Conglomerate"
	short_name = "Ward-Takahashi"
	acronym = "WT"
	desc = "Ward-Takahashi focuses on the sale of small consumer electronics, with its computers, communicators, \
	and even mid-class automobiles a fixture of many households. Less famously, Ward-Takahashi also supplies most \
	of the AI cores on which vital control systems are mounted, and it is this branch of their industry that has \
	led to their tertiary interest in the development and sale of high-grade AI systems. Ward-Takahashi's economies \
	of scale frequently steal market share from Nanotrasen's high-price products, leading to a bitter rivalry in the \
	consumer electronics market."
	history = ""
	work = "electronics manufacturer"
	headquarters = ""
	motto = ""

	ship_prefixes = list("WFV" = "freight", "WTV" = "transport", "WDV" = "asset protection")
	ship_names = list(
		"Comet",
		"Aurora",
		"Supernova",
		"Nebula",
		"Galaxy",
		"Starburst",
		"Constellation",
		"Pulsar",
		"Quark",
		"Void",
		"Asteroid",
		"Wormhole",
		"Sunspots",
		"Supercluster",
		"Moon",
		"Anomaly",
		"Drift",
		"Stream",
		"Rift",
		"Curtain"
		)
	destination_names = list()

/datum/lore/organization/tsc/bishop
	name = "Bishop Cybernetics"
	short_name = "Bishop"
	acronym = "BC"
	desc = "Bishop's focus is on high-class, stylish cybernetics. A favorite among transhumanists (and a bête noire for \
	bioconservatives), Bishop manufactures not only prostheses but also brain augmentation, synthetic organ replacements, \
	and odds and ends like implanted wrist-watches. Their business model tends towards smaller, boutique operations, giving \
	it a reputation for high price and luxury, with Bishop cyberware often rivalling Vey-Med's for cost. Bishop's reputation \
	for catering towards the interests of human augmentation enthusiasts instead of positronics have earned it ire from the \
	Positronic Rights Group and puts it in ideological (but not economic) comptetition with Morpheus Cyberkinetics."
	history = ""
	work = "cybernetics and augmentation manufacturer"
	headquarters = ""
	motto = ""

	ship_prefixes = list("BTV" = "transportation", "BSV" = "research exchange")
	destination_names = list(
	"A medical facility in Angessa's Pearl"
	)

/datum/lore/organization/tsc/morpheus
	name = "Morpheus Cyberkinetics"
	short_name = "Morpheus"
	acronym = "MC"
	desc = "The only large corporation run by positronic intelligences, Morpheus caters almost exclusively to their sensibilities \
	and needs. A product of the synthetic colony of Shelf, Morpheus eschews traditional advertising to keep their prices low and \
	relied on word of mouth among positronics to reach their current economic dominance. Morpheus in exchange lobbies heavily for \
	positronic rights, sponsors positronics through their Jans-Fhriede test, and tends to other positronic concerns to earn them \
	the good-will of the positronics, and the ire of those who wish to exploit them."
	history = ""
	work = "cybernetics manufacturer"
	headquarters = "Shelf"
	motto = ""

	ship_prefixes = list("MTV" = "freight")
	// Culture names, because Anewbe told me so.
	ship_names = list(
		"Nervous Energy",
		"Prosthetic Conscience",
		"Revisionist",
		"Trade Surplus",
		"Flexible Demeanour",
		"Just Read The Instructions",
		"Limiting Factor",
		"Cargo Cult",
		"Gunboat Diplomat",
		"A Ship With A View",
		"Cantankerous",
		"I Thought He Was With You",
		"Never Talk To Strangers",
		"Sacrificial Victim",
		"Unwitting Accomplice",
		"Witting Accomplice",
		"Bad For Business",
		"Just Testing",
		"Size Isn't Everything",
		"Yawning Angel",
		"Liveware Problem",
		"Very Little Gravitas Indeed",
		"Zero Gravitas",
		"Gravitas Free Zone",
		"Absolutely No You-Know-What",
		"Existence Is Pain",
		"I'm Walking Here",
		"Screw Loose",
		"Of Course I Still Love You",
		"Limiting Factor",
		"So Much For Subtley",
		"Unfortunate Conflict Of Evidence",
		"Prime Mover",
		"It's One Of Ours",
		"Thank You And Goodnight",
		"Boo!",
		"Reasonable Excuse",
		"Honest Mistake",
		"Appeal To Reason",
		"My First Ship II",
		"Hidden Income",
		"Anything Legal Considered",
		"New Toy",
		"Me, I'm Always Counting",
		"Just Five More Minutes",
		"Are You Feeling It",
		"Great White Snark",
		"No Shirt No Shoes",
		"Callsign",
		"Three Ships in a Trenchcoat",
		"Not Wearing Pants",
		"Ridiculous Naming Convention",
		"God Dammit Morpheus",
		"It Seemed Like a Good Idea",
		"Legs All the Way Up",
		"Purchase Necessary",
		"Some Assembly Required",
		"Buy One Get None Free",
		"BRB",
		"SHIP NAME HERE",
		"Questionable Ethics",
		"Accept Most Substitutes",
		"I Blame the Government",
		"Garbled Gibberish",
		"Thinking Emoji",
		"Is This Thing On?",
		"Make My Day",
		"No Vox Here",
		"Savings and Values",
		"Secret Name",
		"Can't Find My Keys",
		"Look Over There!",
		"Made You Look!",
		"Take Nothing Seriously",
		"It Comes In Lime, Too",
		"Loot Me",
		"Nothing To Declare",
		"Sneaking Suspicion",
		"Bass Ackwards",
		"Good Things Come to Those Who Freight",
		"Redundant Morality",
		"Synthetic Goodwill",
		"Your Ad Here",
		"What Are We Plotting?",
		"Set Phasers To Stun",
		"Preemptive Defensive Strike",
		"This Ship Is Spiders",
		"Legitimate Trade Vessel",
		"Please Don't Explode II",
		"Get Off the Air",
		"Definitely Unsinkable",
		"We Didn't Do It!",
		"Unrelated To That Other Ship",
		"Not Reflecting The Opinons Of The Shareholders",
		"Normal Ship Name",
		"Define Offensive",
		"Tiffany",
		"My Other Ship is A Gestalt"
		)
	destination_names = list(
		"a trade outpost in Shelf"
		)

/datum/lore/organization/tsc/xion
	name = "Xion Manufacturing Group"
	short_name = "Xion"
	acronym = "XMG"
	desc = "Xion, quietly, controls most of the market for industrial equipment. Their portfolio includes mining exosuits, \
	factory equipment, rugged positronic chassis, and other pieces of equipment vital to the function of the economy. Xion \
	keeps its control of the market by leasing, not selling, their equipment, and through infamous and bloody patent protection \
	lawsuits. Xion are noted to be a favorite contractor for SolGov engineers, owing to their low cost and rugged design."
	history = ""
	work = "industrial equipment manufacturer"
	headquarters = ""
	motto = ""

	ship_prefixes = list("XTV" = "hauling", "XFV" = "bulk transport", "XIV" = "resupply")
	destination_names = list()
	
/datum/lore/organization/tsc/antares
	name = "Antares Robotics Group"
	short_name = "Antares"
	acronym = "ARG"
	desc = "A relative newcomer to the prosthetics and cybernetics market, the Antares Robotics Group builds sturdy, reliable hardware supremely suited to frontier life. They're in direct (and aggressive) competition with Hephaestus Industries, though it remains to be seen what HI will make of these newcomers trying to muscle in on their share of the frontier markets."
	history = ""
	work = "cybernetics manufacturer"
	headquarters = ""
	motto = ""
	
	ship_prefixes = list("ATV" = "transport", "ARV" = "research", "ADV" = "routine patrol", "AEV" = "raw materials acquisition")
	destination_names = list()

/datum/lore/organization/tsc/mbt
	name = "Major Bill's Transportation"
	short_name = "Major Bill's"
	acronym = "MBT"
	desc = "The most popular courier service and starliner, Major Bill's is an unassuming corporation whose greatest asset is their low cost and brand recognition. Major Bill’s is known, perhaps unfavorably, for its mascot, Major Bill, a cartoonish military figure that spouts quotable slogans. Their motto is \"With Major Bill's, you won't pay major bills!\", an earworm much of the galaxy longs to forget."
	history = ""
	work = "courier and passenger transit"
	headquarters = "Mars, Sol"
	motto = ""

	ship_prefixes = list("TTV" = "transport", "TTV" = "luxury transit", "TTV" = "priority transit")
	destination_names = list()

/datum/lore/organization/tsc/independent
	name = "Independent Pilots Association"
	short_name = "Independent"
	acronym = "IPA"
	desc = "Though less common now than they were in the decades before the Sol Economic Organization took power, independent traders remain an important part of the galactic economy, owing in no small part to protective tariffs established by the Free Trade Union in the late twenty-fourth century. Further out on the frontier, independent pilots are often the only people keeping freight and supplies moving."
	history = ""
	work = "trade and transit"
	headquarters = "N/A"
	motto = "N/A"

	ship_prefixes = list("IEV" = "prospecting", "IEC" = "prospecting", "IFV" = "bulk freight", "ITV" = "passenger transport", "ITC" = "just-in-time delivery", "IPV" = "patrol", "IHV" = "bounty hunting")
	destination_names = list()

// Governments

/datum/lore/organization/gov/sifgov
	name = "Sif Governmental Authority"
	short_name = "SifGov"
	desc = "SifGov is the sole governing administration for the Vir system, based in New Reykjavik, Sif.  It is a representative \
	democratic government, and a fully recognized member of the Solar Central Government.  Anyone operating inside of Vir must \
	comply with SifGov's legislation and regulations." // Vorestation Edit. Confederate -> Central
	history = "" // Todo like the rest of them
	work = "governing body of Sif"
	headquarters = "New Reykjavik, Sif, Vir"
	motto = ""
	autogenerate_destination_names = FALSE

	ship_prefixes = list("SGA" = "hauling", "SGA" = "energy relay")
	destination_names = list(
						"New Reykjavik on Sif",
						"Radiance Energy Chain",
						"a dockyard orbiting Sif",
						"a telecommunications satellite",
						"Vir Interstellar Spaceport"
						)

/datum/lore/organization/gov/solgov
	name = "Solar Confederate Government"
	short_name = "SolGov"
	acronym = "SCG"
	desc = "SolGov is a decentralized confederation of human governmental entities based on Luna, Sol, which defines top-level law for their member states.  \
	Member states receive various benefits such as defensive pacts, trade agreements, social support and funding, and being able to participate \
	in the Colonial Assembly.  The majority, but not all human territories are members of SolGov.  As such, SolGov is a major power and \
	defacto represents humanity on the galactic stage."
	history = "" // Todo
	work = "governing polity of humanity's Confederation"
	headquarters = "Luna, Sol"
	motto = "Nil Mortalibus Ardui Est" // Latin, because latin.  Says 'Nothing is too steep for mortals'.
	autogenerate_destination_names = TRUE

	ship_prefixes = list("SCG-T" = "transportation", "SCG-D" = "diplomatic", "SCG-F" = "freight")
	destination_names = list(
						"Venus",
						"Earth",
						"Luna",
						"Mars",
						"Titan",
						"the Jovian subcluster", 
						)// autogen will add a lot of other places as well.


// To be expanded upon later, once the military lore gets sorted out.

// Military

/datum/lore/organization/mil/wolfpack
	name = "Wolfpack Security"
	short_name = "WolfSec"
	acronym = "WPS"
	desc = "Wolfpack Security is a merging of several much smaller freelance companies, and operates throughout civilized space. Unlike some companies, it operates no planetside facilities whatsoever, opting instead for larger flotillas that are serviced by innumerable smallcraft. As with any PMC there's no small amount of controversy surrounding them, but they try to keep their operations cleaner than their competitors."
	history = ""
	work = "mercenary contractors"
	headquarters = ""
	motto = ""

	ship_prefixes = list("WPF" = "secure freight", "WPS" = "logistics", "WPV" = "patrol", "WPH" = "bounty hunting", "WPX" = "experimental", "WPC" = "command", "WPI" = "mercy")
	destination_names = list(
						"Wolfpack Command",
						"a WPS patrol fleet",
						"a WPS flotilla",
						"a WPS training fleet",
						)

/datum/lore/organization/mil/blackstar
	name = "Blackstar Legion"
	short_name = "Blackstar"
	acronym = "BSL"
	desc = "Shrouded in mystery and controversy, Blackstar Legion is said to have its roots in pre-FTL Sol private military contractors. Their reputation means that most upstanding corporations and governments are hesitant to call upon them, whilst their prices put them out of the reach of most private individuals. As a result, they're mostly seen as the hired thugs of frontier governments that don't (or won't) answer to SolGov."
	history = ""
	work = "mercenary contractors"
	headquarters = ""
	motto = ""

	ship_prefixes = list("BSF" = "secure freight", "BSS" = "logistics", "BSV" = "patrol", "BSH" = "security", "BSX" = "experimental", "BSC" = "command")
	destination_names = list()

