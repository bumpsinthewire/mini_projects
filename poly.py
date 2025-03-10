class Animal:
    def __init__(self, name: str):
        self.name = name
    def make_sound(self):
        print("Animal noise")

# Your Bird class
class Bird(Animal):  # Added inheritance
    def make_sound(self):
        print(f"{self.name} chirps")  # Your answer
        
class Dog(Animal):
    def make_sound(self):
        super().make_sound()
        print(f"{self.name} barks")

# Your animal_sound function
def animal_sound(animal: Animal):
    animal.make_sound()  # Fill this in!

# Your test
animal_sound(Bird("Tweety"))
animal_sound(Dog("Fluffy"))  # Your call