def my_uniq(array)
    uniq_array = []

    array.each do |num|
        uniq_array << num unless uniq_array.include?(num)
    end
    uniq_array
end

def two_sum(array)
    fil_pairs = []

    ((array.count)-2).times do |idx1|
        (idx1 + 1).upto(array.count - 1) do |idx2|
            fil_pairs << [idx1, idx2] if  array[idx1] + array[idx2] == 0
        end
    end
    fil_pairs
end

def my_transpose(array)
    array.transpose
end


def pick_stocks(stock)
    best_pair = nil
    best_profit = 0

    stock.each_index do |buy_date|
        stock.each_index do |sell_date|
            next if buy_date > sell_date

            profit = stock[sell_date]- stock[buy_date]
            if profit > best_profit
                best_pair = [buy_date, sell_date]
                best_profit = stock[sell_date]- stock[buy_date]
            end
        end
    end
    best_pair

end
