User.destroy_all
user_data = [
  {
    username: "whocheckin",
    full_name: "Resilient.Chic.Humble.👑💁"
  },
  {
    username: 'teaaa_coffeee',
    full_name: 'Jill of All Trades✨'
  },
  {
    username: 'out_the_wayyyyy',
    full_name: 'Devonta. Y'
  },
  {
    username: 'shegotmilesonher',
    full_name: 'Miles💰📚🏀'
  },
  {
    username: 'thepeopleschamp__',
    full_name: 'Coach Brown M.S.Ed'
  },
  {
    username: 'manskiii400',
    full_name: 'Manskii400',
  },
  {
    username: 'mellie_nelllie',
    full_name: '🇧🇿'
  },
  {
    username: 'niqnatural',
    full_name: 'Adia Smith'
  },
  {
    username: 'ekyra.kyaira',
    full_name: 'Ekyra🦋'
  },
  {
    username: 'ihm_eech',
    full_name: 'Meech♊'
  },
  {
    username: 'mcjaneyeboah',
    full_name: 'Mcjane Yeboah'
  },
  {
    username: '__kishantel',
    full_name: 'Kierra D'
  },
  {
    username: 'the.main.brat.bamb',
    full_name: 'Amber Martin'
  },
  {
    username: "_melsoauthentic",
    full_name: 'Melanie 💚'
  },
  {
    username: 'jayhunt__',
    full_name: 'Jay Hunt'
  },
  {
    username: 'morenilessu',
    full_name: 'Ni'
  },
  {
    username: 'kasherboomy',
    full_name: 'MoneyBags💰'
  }
]

avatar_images_path = Rails.root.join('db', 'ig-clone-photos')
avatar_images = (1..(Dir.children(avatar_images_path).length - 1))
                  .to_a
                  .map { |int| "#{int}.jpg" }
def attach_avatar(user, avatar_image)
  user.avatar.attach(
    io: File.open(Rails.root.join('db', 'ig-clone-photos', avatar_image)),
    filename: avatar_image,
    content_type: 'image/jpeg' # or the correct content type for your images
  )
end

avatar_images.each_with_index do |avatar_image, i|
  puts 'Creating user: ' + user_data[i][:full_name] + ' with image ' + avatar_image + '...'
  user = User.new(user_data[i])
  user.password = 'password'
  user.email = "test#{i}@gmail.com"
  user.birth_date = '1994-01-29'
  user.save!
  attach_avatar(user, avatar_image)
end