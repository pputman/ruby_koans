#!/usr/bin/ruby -w
=begin
balance = 100
balancefile = 'balance.txt'
if File.file? balancefile 
	File.open(balancefile, "r") do |balancefile|
	balance = balancefile.gets.to_i
	balancefile.close
	end
=end
@transaction_log = [100]

def balance
#  total = 0
#  @transaction_log.each do |log_item|
#    total += log_item
#  end
#  total
  @transaction_log.inject(&:+)
end

puts "balance is #{balance}\n"

transaction=nil
until transaction == 3
#until transaction == 1 or transaction == 2
  puts "Select a transaction:\n\n1.Deposit\n2.Withdrawal\n3.Exit\n"
  transaction = gets.chomp.to_i
  if ![1,2,3].include?(transaction)
    puts "Invalid transaction, please try again"
  end

  if transaction == 1
    puts "Please Enter the amount to deposit\n"
    deposit = gets.chomp.to_i
    @transaction_log <<  deposit
  end

  if transaction == 2
    puts "Please enter the amount to withdraw\n"
    withdrawal = gets.chomp.to_i
    @transaction_log <<  -withdrawal
  end

  puts "Balance is #{balance}" unless transaction == 3
  puts @transaction_log.inspect
end

puts "Final balance is #{balance}"
