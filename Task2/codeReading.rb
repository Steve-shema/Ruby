# Please explain what the code below does ... (A)
We enter the number of seats and groups and then split it into parts
seats_and_gloups = gets.split(/\s/)

# Please explain what the code below does ... (B)
empty_seat = [*1..(seats_and_gloups[0].to_i)]
# Please explain what the code below does ... (C)
seats_count = empty_seat.count
# Please explain what the code below does・・・（D）
number_of_visitors = seats_and_gloups[1].to_i

# Please explain what the code below does・・・（E）
[*1..number_of_visitors].each do
  # Please explain what the code below does・・・（F）
  used_seats = gets.split(/\s/)
  # Please explain what the code below does・・・（G）
  users = used_seats[0].to_i
  # Please explain what the code below does・・・（H）
  seating_number = used_seats[1].to_i

  # Please explain what the code below does・・・（I）
  fill_last_number = ((seating_number + users) - 1)

  # Please explain what the code below does・・・（J）
  if fill_last_number > seats_count
    # Please explain what the code below does・・・（K）
    # (The following code is difficult to understand, so a hint will be added below)

    # 「The number of the seat the last group occupied is = "The number of the last seat of this group"-"total number of seats" (because it is a round table).
    # For example, if fill_last_number == 13, and if the seats_count is 12, 1 = 13-12, and the last person sits in the seat number 1.
    fill_last_number = fill_last_number - seats_count
    # The following code is difficult to understand, so a hint will be added below

    # next_seat_candidate is an array to determine "Is there already a person sitting at that seat?"
    # ([* 1..seats_count]-empty_seat) means ("all seats"-"seats that have not been occupied yet"). In other words, the number of "seats already occupied by people" is ([* 1..seats_count-empty_seat)
    # [* seating_number..seats_count] is the meaning of [* "the number of the seat where this group is seated first" .. "the number of the last seat"]
    # [* 1..fill_last_number] is the meaning of [* "1 (first seat) .." "the number of the seat where the last group is seated"]
    # So, next_seat_candidate = ([* 1..seats_count]-empty_seat) + [* seating_number..seats_count] + [* 1..fill_last_number],
    # next_seat_candidate = "Seat already occupied" + [* "The number of the seat where the first group is seated." "The number of the last seat"] + [* "1 (First seat)" .. "This is the number of the last seat in the group."
    # In other words, if the next_seat_candidate array contains the same numbers, "a new group of people is trying to sit in the already filled seat"
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]
  else
    # Please explain what the code below does・・・（L）
    # The following code is difficult to understand, so a hint will be added below

    # next_seat_candidate = "the seat where people are already seated" + [* "the number of the seat where this group occupied first" .. "the number of the seat where this group occupied last"]
    # In other words, if the same number is included in the next_seat_candidate array, it means that a new group of people is trying to sit in the already occupied seat.  
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..fill_last_number]
  end

  # Please explain what the code below does・・・（M）
  if next_seat_candidate.count == next_seat_candidate.uniq.count
    # Please explain what the code below does・・・（N）
    if ((seating_number + users) - 1) > seats_count
      # Please explain what the two lines of code below do ... (O)
      empty_seat = empty_seat - [*1..fill_last_number]
      empty_seat = empty_seat - [*seating_number..seats_count]
    else
      # Please explain what the code below does・・・（P）
      empty_seat = empty_seat - [*seating_number..fill_last_number]
    end
  end
end

# Please explain what the code below does ... (Q)
puts seats_count - empty_seat.count
