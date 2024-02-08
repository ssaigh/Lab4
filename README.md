# Lab 4. Book Manager & Ruby

Objectives:
-

- Learn how to setup rails models and relationships
- Sharpen db skills using the rails db console with a sqlite database
- Learn the basics of Ruby programming
- Learn how to use coditional structures and loops in Ruby

Due Date:
-

**February 08, 2024** by the end of the lab session :)

Important Note
===============

In this lab, you have a total of **3 checkpoints** to validate with one of the teaching team members during the lab session.

Checkpoints will be graded as follows:

- Checkpoint 1: 35 points
- Checkpoint 2: 20 points
- Checkpoint 3: 20 points
- Checkpoint 4: 15 points

Part 1: Rails Models
===============
    
1. Clone the starter code for the BookManager application using the following command: 

		git clone https://github.com/S24-67272Qatar/Lab4-<your git username>.git

This will create a Rails app folder named Lab5-<your git username>

3. Switch directories (`cd`) into this Rails app from the terminal

4. Run `bundle install` to install all the gems required. Then run `rails g simple_form:install` to install simple_form, a gem that we will need later.

5. Create the following three models from the command line using the command:

        rails generate model <ModelName> <attribute>:<data type>

  Below are the details of each model:


  ### Publisher
  - name (string)

  ### Book
  - title (string)
  - year_published (integer)
  - publisher_id (integer) (a foreign key to the Publisher)
  
  ### Author
  - first_name (string)
  - last_name (string)

	We don't need a full set of views or a controller, only the models are needed here, so using a model generator is sufficient in this case.

3. Create an additional model called `BookAuthor` using the `rails generate model` command. The attributes of this model are `book_id (integer)` and `author_id (integer)`.

  After creating these models, migrate the database and save all this generated code to git. 

4. Create and switch to a new branch in git called "models". Open the `Book` model in your editor and add the following three relationships to that model: 

  ```ruby
  belongs_to :publisher                     
  has_many :book_authors
  has_many :authors, through: :book_authors              
  ```
  
   Add the following scope that will put the books in alphabetical order.  You can do this easily with Copilot with the following comment:

    ```ruby
    # scope that returns books in alphabetical order
    ```
    
   or write it on your own.
   
   Finally, add this scope:
   ```ruby
     scope :last_decade, ->{where('year_published>?', 2011)}
    ```
    
   Commit your code to Git.

 
5. Go to the Publisher model and add the following relationship and scope:
 
  ```ruby
  has_many :books 
  scope :alphabetical, -> { order('name') }
  ```                                              

6. Go to the Author model and add the following relationship and scope: 

  ```ruby
  has_many :book_authors
  has_many :books, through: :book_authors                    
  ```

In addition, add the following scopes and methods:

 ```ruby
  scope :alphabetical, ->{order('last_name, first_name')}
  
  def name
  "#{last_name}, #{first_name}" # this is a concatenation of both variable values using string interpolation
  end                    
  ```

7.  Go to the BookAuthor model and add the following relationship: 

  ```ruby
  belongs_to :book
  belongs_to :author
  ```

8. Once the model code is complete, start the rails console (`rails console`), be sure it is running and that there are no typos (common error) in your code by going through the following steps:

- Start the rails console  (`rails console` or `rails c`)
- Enable Hirb using: `Hirb.enable`

 `Hirb` is a ruby gem that is provided to us that allows us to read queries in a much cleaner manner. Without it, a query can get so messy.

- Populate all the tables with some examples (think of using the `create` method)

- Test the relationships (make sure you are able to access information between tables using the special relationship methods)

- Test all the scopes as well as the special method `name`.

- Test the following methods on Books: `find`, `find_by`, and `where`. What is the differences between them. Check the class of the result returned by each of the methods.

- If it's all good:

  **a.** commit these changes to your git repo. Make sure you have no untracked files using `git status`. Then, merge these changes into the main branch. 
  Reminder, that should look like `git checkout main` to get back to the main branch and `git merge models` to incorporate your most recent updates.

  **b.** To push your code to your private repository, you should first have your git remote url added using  `git remote add origin 'https://github.com/S24-67272Qatar/lab4-<your git username>.git'`

  **c.** Finally run `git push -u origin main`
- - -
**Checkpoint 1**: Show a CA that you have the basic Rails app set up and working. Also show the CA all the models operations on rails console and that you have properly saved the code to git.
- - -

Part 2: Rails db
-

1. We'll begin by adding some more publishers directly into the database using the command line. The easiest way to insert new data is by opening a new command line tab in the same directory and running `rails db`. Then paste the publishers_sql and authors_sql codes given below so that we have multiple publishers and authors to choose from (and sharpen our db skills slightly). 

  ```sql
  -- SQL for authors
  INSERT INTO "authors" VALUES (1, 'Sam', 'Ruby', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (2, 'Dave', 'Thomas', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (3, 'Hal', 'Fulton', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (4, 'Robert', 'Hoekman', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (5, 'David', 'Hannson', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (6, 'Dante', 'Alighieri', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (7, 'William', 'Shakespeare', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "authors" VALUES (8, 'Jane', 'Austen', '2015-02-09 12:00:00', '2014-02-10 12:00:00');

  -- SQL for publishers
  INSERT INTO "publishers" VALUES (1, 'Pragmatic Bookshelf', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "publishers" VALUES (2, 'Washington Square Press', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "publishers" VALUES (3, 'Addison Wesley', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "publishers" VALUES (4, 'Everyman Library', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  INSERT INTO "publishers" VALUES (5, 'New Riders', '2015-02-09 12:00:00', '2014-02-10 12:00:00');
  ```

	**Note**: You can at all times drop the whole database by running `rails db:drop` and re-create it again just by running `rails db:migrate`. When the database is dropped, the migration files do not get deleted. Hence, you can simply re-create the database and its tables by executing the migration again.

Make sure you push all the changes to your GitHUb repository.
  
- - -
**Checkpoint 2**: Show a CA that you could add the examples of authors and publishers to the database.
- - -
Part 3: Ruby Introduction and Conditionals
===========

This part of the lab will get everyone familiar with some Ruby basics and provides a review of other key concepts. 

1. We are going to begin by writing a simple program for Ruby to convert temperatures and then modify it several times. 

	a. First, Connect to the VMWare and open Visual Studio Code. Please review the steps provided to you in lab1, if needed.
	
	b. Open a new terminal (Terminal --> New Terminal). Then in this terminal, create a new folder named `lab4` (`mkdir lab4`) then go in this new folder (`cd lab4`), where you will save all your ruby files for this lab. 
		
	
	b. Now create a new file called `temp_conversions.rb`. In VS Code, just use `File --> new File`. Then save the file as a Ruby file. Do not forget to indicate the `.rb` extension.
	
	c. In this file, create a method called `convert` that takes `temp` as a parameter (temperature in Fahrenheit) and converts it to its equivalent in Celsius. Check this [link](https://www.thoughtco.com/fahrenheit-to-celsius-formula-609230) to get the Fahrenheit to Celsius formula.
	
	d. Create some simple tests for this method with the code below:
	
	```ruby
	  puts convert(32)          
	  puts convert(50)          
	  puts convert(212)
	```
	 
    e. Run this code from the command line using the following command:
    
    	ruby temp_conversions.rb
    
    f. Once this is running, set up a git repository and add this file to it 	(Please do not spend much time on this, make sure you ask a teaching member if you don't remember how to do this from the previous labs).


2. Add the test `puts convert("zero")` to the tests and rerun the code normally.  Why did you get an error?  

	a. To correct this, we will limit all temperatures to integers by adding a line before the calculation in our method: 

  ```ruby
  return "Temperature must be an integer" unless temp.class == Integer
  ``` 

 	Rerun these tests after adding this line.  If the tests pass, add the revision to the git repository.

   The Ruby `unless` statement xecutes code **if the condition is false**. If the condition is true, the code specified in the else clause is executed.
	`unless` is the logical opposite of `if`.

 b. Ruby offers also conditional structures that are pretty common to modern languages. Let's check how we could solve the same using an `if` statement.
 
  ```ruby
  	return "Temperature must be an integer" if temp.class != Integer
  ``` 

**Note:** Notice that if we want to return before the end of method, we need to use the return keyword, but if the method runs its course, the last value is automatically returned by the method.  Finally, notice the use of the inline If (where the the condition is placed at the end of the line).

3. Add the test `puts convert(-500)` to the tests and rerun.  Of course, remembering your basic physics leaves you distressed at this point because you know this answer is in error – Absolute Zero is at –474 degrees Fahrenheit or -270 degrees Celsius, making this result impossible.  To make sure our program doesn't give silly answers, we will add another line after the last correction (and before the calculation): 

  ```ruby
  return "Temperature below Absolute Zero" if temp < -474 
  ```
 
 Rerun the tests; assuming they pass, save the revision to the git repository.
  We call this an **inline if**. It is usually used in this format `<code if condition>` and used when only one condition is to be tested. It executes code if the condition is true.

4. Of course, we have only half the temperature conversion problem – converting Fahrenheit to Celsius – and have no capability to convert Celsius to Fahrenheit.  Create a new branch in git called `exp` and switch to it.  Now in your code, add another argument called `measure` and using an `if ... else ... end` construct, correct the code so that either a Fahrenheit or Celsius temperature is converted.  Set up the `measure` argument so its default value is "F".  Add the test below:

  ```ruby  
  puts convert(0, "C")
  puts convert(10, "C")
  puts convert(100, "C")
  puts convert(-280, "C")
  ```

Rerun the code; if all tests pass, save to the repository.

5. Looking at the results, we see that the code is still problematic: we get a result for –280 oC even though we know that value is below Absolute Zero.  There are a number of ways to correct this, but for learning purposes here, we are going to create a new method called `below_absolute_zero?` which has two arguments: `temp` and `measure`.  This method will simply return a boolean of `true` if the temperature for the measurement system is below the critical value; this is why this method will end in a question mark. Create the basic structure for this method now.

  ```ruby
  def below_absolute_zero?(temp, measure)
		# your code goes here
  end
  ```
  
6. Back to the code: go to the convert method and change the if statement for the Absolute Zero condition so that it references this new method rather than the simple statement of `temp < -474`.  Rerun the code and make sure that everything is working properly.  If so, save this code to the git repository. Checkout the `master` branch, and then merge the `exp` branch onto the `master` branch.

7. More on Conditionals:

- Create a new Ruby file named `conditionals.rb`

- When only one condition is to be tested, we use the `if` modifier as in the following example. Copy this code and paste it in conditionals.rb. Then run it using `ruby conditionals.rb`.

```ruby
age=35
if age < 105
	puts "don't worry, you are still young!"
end
```

**Note**: The conditional testing happens within a block that starts with `if` and finishes with `end`. The `end` is mandatory.

- The `if/elsif/else/end` conditional structure: copy the code below and run it.

	```ruby
	x = 1
	if x > 2
	   puts "x is greater than 2"
	elsif x <= 2 and x!=0
	   puts "x is 1"
	else
	   puts "I can't guess the number"
	end
	``` 
 Notice that Ruby uses `elsif`, not `else if` nor `elif`.

- - -
**Checkpoint 3**. Show a CA/TA that you have completed the first part by testing the convert and below_absolute_zero? and showing her/him that they work fine. Also, make sure you show her/him the history of your git activity.

- - -
Part 4: Ruby Loops 
===========
Looping in programming languages is a feature which clears the way for the execution of a set of instructions or functions repeatedly  when some of the condition evaluates to true or false.  Ruby provides the different types of loop to handle the condition based situation in the program to make the programmers task simpler. 

1. Create a new Ruby file named `loops.rb` and add to it all the Ruby codes given in the next questions of this part (2 to 9).

2. Looping with `for`

		for variable_name in expression  
		
		     # # code to be executed
		end
		
	In a for loop, the expression could be a range, an array, keys in a hash.
	
	a. Using an array: 
	
	Add the following lines in loops.rb and test it.

			array = [10, 91, 2, 333, 4, 5]
			for elem in array
			     puts elem
			end
			
			array2 = ["hi", "you", "ruby", "programming"]
			for elem in array2
				puts elem
			end

	b. Using Range
		- In Ruby, `1..5` is an object of type **Range**
		- Ruby creates sequences using the ".."" range operator.
		- A Sequence has a start point, an end point and way to produce successive values.
		- `1..5` generates the sequence `1, 2, 3, 4, 5`

			for i in 1..5 
			     puts "Value of local variable is #{i}"
			     puts array[i]
			end

3. Looping with while

The syntax of While loops is similar to Python with a small difference: the `end` at the end of the loop is mandatory

		index=0
		while index<array.length
		     puts "Value of current element is #{array[index]}"
		     index+=1
		end
		
Another example

		n = 0
		while n < 4
		  puts n
		  n += 1
		end
		
4. Looping with the `times` method in Ruby

 This is the easiest loop you can work with.
 
 a. Try the following Ruby code:
 
		30.times {puts "I will not throw paper airplanes"} 
 
 This code prints the message "I will not throw paper airplanes" 30 times.

b. But what if we want the iterator (iterative index)? We can do this using the iterator offered in times. 

	75.times { |i| puts "hello #{i}" }


`times` is a Ruby built-in method that takes a **block** (a block of code with a set of instructions as an 'argument'). We will discuss blocks more in details in the next lecture.


5. Lopping with the `each` Ruby method

The `each`  Ruby method allows you to go over a list of items,  without having to keep track of the number of iterations, or having to increase some kind of counter. We tell the `each` method what to do with every item by using a **block**.

The general syntax of each is as follows:

		(expression).each do |element| 
		     your instructions here 
		end

6. We can use the each method to iterate over the individual items in an range (a sequence). Read the code below and test it.

		(1..4).each do |element|
		     puts "The Value of the local variable element is #{element}"
		     element=element/20
		     puts element
		     if element%2==0
		          puts "the element is even!"
		     end
		end
		
And this is equivalent to 
		
		range= 1..4
		range.each do |element|
		    puts "The Value of the local variable element is #{element}"
		end

7. We can use each to iterate over the elements of an array

		# Array of integers
		[1, 2, 3, 4].each do |element|
		     puts "The Value of the local variable i is #{element*65}"
		end
		
		# Array of strings
		string_array=["a", "b","c", "d"]
		string_array.each do |item|
		     puts "The value of i is #{item.upcase}"
		end

8. When one instuction is included in the block, we can write it as follows

		string_array.each {|item| puts "The current array item is #{item}"}

9. We can also manipulate items inside of an each block, unless we reassign the new value to the item in the array,  the following code will leave the original array unchanged

		array = [100, 11, 25, 36, 47, 5]
		array.each do |item|
		  item = item + 2
		  puts "The current item + 2 is #{item}."
		end
		

**Note**: More on loops: https://www.rubyguides.com/ruby-tutorial/loops/

- - -
**Checkpoint 4**. Show a CA/TA that you completed this part successfully!
- - -


