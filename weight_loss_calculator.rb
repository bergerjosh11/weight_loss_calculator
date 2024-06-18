def calculate_calories_per_day(activity_level)
  case activity_level.downcase
  when 'inactive'
    1800
  when 'low'
    2000
  when 'moderate'
    2200
  when 'high'
    2500
  else
    raise 'Invalid activity level. Please choose from inactive, low, moderate, high.'
  end
end

def calculate_weight_loss(weight, activity_level, daily_calorie_intake, days)
  calories_per_day = calculate_calories_per_day(activity_level)
  total_calorie_deficit = (calories_per_day - daily_calorie_intake) * days
  weight_loss_kg = total_calorie_deficit / 7700.0 # 1 kg weight loss per 7700 calorie deficit
  weight_loss_lb = weight_loss_kg * 2.20462 # Convert kg to pounds
  weight_loss_lb
end

def get_user_input(prompt)
  print prompt
  gets.chomp
end

def main
  weight = get_user_input('Enter your current weight (lbs): ').to_f
  activity_level = get_user_input('Enter your activity level (inactive, low, moderate, high): ')
  daily_calorie_intake = get_user_input('Enter your daily calorie intake: ').to_i
  days = get_user_input('Enter the number of days: ').to_i

  begin
    weight_loss = calculate_weight_loss(weight, activity_level, daily_calorie_intake, days)
    puts "You will lose approximately #{weight_loss.round(2)} lbs in #{days} days."
  rescue => e
    puts e.message
  end
end

main if __FILE__ == $0
