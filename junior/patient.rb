# Przedstawiona jest klasa Patient. Wskaż błędy.

# class Patient
#   def initialize(id:, first_name = nil, last_name: nil)
#     @id = id
#     @firstName = first_name
#     @last_name = last_name
#   end

#   def self.patient?(id)
#     id != @id
#   end

#   def full_name
#     firstName + last_name
#   end
# end

# ----------------

# BŁĘDY:

# 1. id: -> id (przekazujemy tutaj argument, a nie wartość)
# 2. last_name: nil -> last_name = nil (bo chcemy ustawić default, a nie wartość argumentu)
# 3. @firstName -> @first_name (snake case zamiast camel case)
# 4. full_name -> przykład: "#{@first_name} #{last_name}" (w tym momencie stworzymy "KarolTychek na przykład". Brak fail-safe na wartość jako nil.
# 5. first_name oraz last_name przerzuciłbym do attr_accessor zamiast trzymać w initialize
# 6. self.patient? -> patient? powinno być metodą z modułu albo oddzielną metodą z tej klasy. Nie mona wywołać nieistniejącej metody na self.
# 7. Dodatkowo w przypadku patient? raczej nie ma sensu jej trzymać w klasie Patient - w końcu zawszze powinno być true. Ponadto nie powinniśmy do obiektu przekazywać wartości z innego obiektu.

  patient_1 = Patient.new(id: "123")
  patient_1.patient?("123")
  patient_1.full_name
  patient_2 = Patient.new("Karol", "Tychek")
  patient_2.patient?("123")
  patient_2.full_name
  patient_3 = Patient.new(id: "123", "Roman")
  patient_3.patient?("Roman")
  patient_3.full_name
