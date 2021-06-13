accounts = %w(Good Better Best)

  puts "I'm creating your accounts "
  accounts.each do |name|
    Account.create!(
      name: name,
      subdomain: name.downcase
    )
  end
  puts "Done creating your accounts"

2.times do
  Account.all.each do |account|
    Post.create!(
      account_id: account.id,
      title: "Post for account name #{account.name}",
      body: %Q{Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum aliquid maiores id aut minima voluptatem dolorem, sint quas error debitis impedit ex corporis asperiores eaque ipsum suscipit ducimus fugiat corrupti!}
    )
  end
end
