# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

from_names = []
to_names = []
all_names = []
index = 0
index_max = blockchain.length

loop do 
  if index == index_max
    break
  end
  if blockchain[index]["from_user"] != nil
    from_names.push(blockchain[index]["from_user"])
    from_names = from_names.uniq
  end
  if blockchain[index]["to_user"] != nil
    to_names.push(blockchain[index]["to_user"])
    to_names = to_names.uniq
  end
  index = index + 1
end

all_names = ((from_names + to_names).uniq)

wallets = [{}]

index = 0

loop do 
  if index == all_names.length
    break
  end
  if index == 0 
    wallets = [{"user" => all_names[index], "balance" => 0}]
  end
  if index != 0 
    wallets = wallets + [{"user" => all_names[index], "balance" => 0}]
  end
  index = index + 1
end

index = 0
loop do 
  if index == blockchain.length
    break
  end
  from_user_location = all_names.index(blockchain[index]["from_user"])
  to_user_location = all_names.index(blockchain[index]["to_user"])

  if from_user_location != nil
    wallets[from_user_location]["balance"] = wallets[from_user_location]["balance"] - blockchain[index]["amount"]
  end

  if to_user_location != nil
    wallets[to_user_location]["balance"] = wallets[to_user_location]["balance"] + blockchain[index]["amount"]
  end
  index = index + 1
end

index_output = 0

loop do 
  if index_output == wallets.length
    break
  end
  name_output = (wallets[index_output]["user"]).capitalize
  number_output = (wallets[index_output]["balance"]).to_s
  puts name_output + "'s KelloggCoin balance is " + number_output
  index_output = index_output + 1
end

