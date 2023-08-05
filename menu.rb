require_relative 'interface'
require_relative 'players'

def menu
    conversor = RegNumConversor.new
    puts "Welcome to worker register"
    puts "Select one option: 
            1. Create new register
            2. See your saved registers
            3. End"
    print "Option: "
    get_option = gets.to_i
    case get_option
    when 1
        loop do
            print "What is the worker name: "
            wk_name = gets.to_s
            print "What is the worker age: "
            wk_age = gets.to_s
            print "Type worker's CPF number with final digit together: "
            wk_cpf = gets.to_i
            print "Type worker's RG number with final digit together: "
            wk_rg = gets.to_s
            print "Type worker's PIS number with final digit together: "
            wk_pis = gets.to_i

            wk_docs = [conversor.to_cpf(wk_cpf), conversor.to_rg(wk_rg), conversor.to_pis(wk_pis)]

            worker = Worker.new(wk_name, wk_age, wk_docs)
            worker_list = Array.new
            worker_list << worker
        
            puts "Do you want to create another register? y/n"
            answer = gets.to_s
            if answer == "y" || answer == "yes" || answer == "Y" || answer == "YES" || answer == "Yes"
                next
            elsif answer == "n" || answer == "no" || answer == "N" || answer == "NO" || answer == "No"
                break
            else
                puts "Invalid entry"
            end


        end
    
    when 2
        worker_list.each do |register|
            puts register
        end
    when 3
        return puts "System shutdown"
    end
end

menu