local Table = {
	{ 
		Name = "chitin", 
		Table = "Chitin", 
		Type = "Primitive", 
		Tier = 1,
		DMG_Type = "physical",
	},
}

for k,v in pairs(Table) do
    table.insert(Material_Table, Table[k])
end