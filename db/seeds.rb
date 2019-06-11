groups = Group.create([
  { name: "group1" },
  { name: "group2" },
  { name: "group3" },
  { name: "group4" },
  { name: "group5" }
])
users = User.create([
  { name: 'user1', group_id: groups[4].id },
  { name: 'user2', group_id: groups[2].id },
  { name: 'user3', group_id: groups[0].id },
  { name: 'user4', group_id: groups[3].id },
  { name: 'user5', group_id: groups[3].id },
  { name: 'user6', group_id: groups[4].id },
  { name: 'user7', group_id: groups[1].id },
  { name: 'user8', group_id: groups[2].id },
  { name: 'user9', group_id: groups[1].id },
  { name: 'user10', group_id: groups[0].id }
])
