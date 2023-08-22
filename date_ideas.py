import tkinter as tk
from tkinter import messagebox
import random


class DateIdeasGeneratorApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Random Date Ideas Generator")

        self.date_ideas = [
            "Have a picnic in the park.",
            "Visit a local museum.",
            "Go stargazing on a clear night.",
            "Cook a new recipe together.",
            "Take a scenic hike.",
            "Watch a classic movie at home.",
            "Explore a nearby town you've never been to.",
            "Attend a live music event.",
            "Visit a local farmers' market.",
            "Have a game night with board games or video games.",
            "Go skating in the park.",
            "Walk the waterfront get an icecream.",
            "Go to a new restaurant."
        ]

        self.generate_button = tk.Button(root, text="Generate Random Date Idea", command=self.generate_random_idea)
        self.generate_button.pack(pady=20)

    def generate_random_idea(self):
        random_idea = random.choice(self.date_ideas)
        messagebox.showinfo("Random Date Idea", random_idea)


if __name__ == "__main__":
    root = tk.Tk()
    app = DateIdeasGeneratorApp(root)
    root.mainloop()
