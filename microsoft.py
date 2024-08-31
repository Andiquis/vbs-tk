import tkinter as tk
from tkinter import messagebox
from datetime import datetime

class HackerConsole:
    def __init__(self, master):
        self.master = master
        self.master.attributes("-fullscreen", True)  # Pantalla completa
        self.master.bind("<Escape>", self.close_fullscreen)  # Salir de pantalla completa al presionar Escape
        self.master.configure(bg="black")  # Fondo negro

        self.create_welcome_screen()
        self.update_time()  # Llama a la función para actualizar la hora

    def close_fullscreen(self, event=None):
        self.master.attributes("-fullscreen", False)
        self.master.quit()

    def create_welcome_screen(self):
        welcome_label = tk.Label(self.master, text="Bienvenido al Sistema", font=("Courier", 36), fg="lime", bg="black")
        welcome_label.pack(pady=50)

        # Botón de Ingreso Default
        default_button = tk.Button(self.master, text="Acceso Default", command=self.default_access, width=20, bg="green", fg="black", font=("Courier", 16))
        default_button.pack(pady=20)

        # Botón de Ingreso Root
        root_button = tk.Button(self.master, text="Acceso Root", command=self.show_login_form, width=20, bg="red", fg="black", font=("Courier", 16))
        root_button.pack(pady=20)

        # Contenedor de Hora y Fecha
        self.time_frame = tk.Frame(self.master, bg="black")
        self.time_frame.pack(side=tk.RIGHT, padx=50, pady=20)

        self.time_label = tk.Label(self.time_frame, text="", font=("Courier", 24), fg="lime", bg="black")
        self.time_label.pack()

        self.date_label = tk.Label(self.time_frame, text="", font=("Courier", 24), fg="lime", bg="black")
        self.date_label.pack()

        # Contenedores de contenido de Kali Linux
        self.kali_content_frame = tk.Frame(self.master, bg="black")
        self.kali_content_frame.pack(side=tk.LEFT, padx=50, pady=20)

        kali_checks = [
            "1. nmap comprobando y escaneando redes locales ... done",
            "2. comprobando la seguridad del sistema ... done",
            "2. Autenticando al usuario... done",
            "3. Iniciando sesion en el sistema... done",
            "4. Ejecutando scripts de Sistema Operativo... done",
            "7. Analizando Hadware del sistema ... done",
            "5. Terminando tareas... done",
            
        ]

        for check in kali_checks:
            check_label = tk.Label(self.kali_content_frame, text=check, font=("Courier", 16), fg="cyan", bg="black")
            check_label.pack(anchor=tk.W)

    def default_access(self):
        messagebox.showinfo("Acceso Default", "¡Acceso otorgado! Saliendo de la consola...")
        self.master.destroy()  # Cierra la ventana de la consola

    def show_login_form(self):
        self.login_window = tk.Toplevel(self.master)
        self.login_window.title("Formulario de Ingreso")
        self.login_window.geometry("300x200")
        self.login_window.configure(bg="black")  # Fondo negro

        user_label = tk.Label(self.login_window, text="Usuario:", fg="lime", bg="black")
        user_label.pack(pady=5)
        self.user_entry = tk.Entry(self.login_window)
        self.user_entry.pack(pady=5)

        password_label = tk.Label(self.login_window, text="Contraseña:", fg="lime", bg="black")
        password_label.pack(pady=5)
        self.password_entry = tk.Entry(self.login_window, show="*")
        self.password_entry.pack(pady=5)

        login_button = tk.Button(self.login_window, text="Iniciar Sesión", command=self.check_credentials, bg="blue", fg="white")
        login_button.pack(pady=10)

    def check_credentials(self):
        username = self.user_entry.get()
        password = self.password_entry.get()

        if username == "Admin" and password == "admin123":
            messagebox.showinfo("Éxito", "¡Bienvenido, Admin!")
            self.login_window.destroy()  # Cerrar ventana de inicio de sesión
        else:
            messagebox.showerror("Error", "Usuario o contraseña incorrectos.")

    def update_time(self):
        now = datetime.now()
        self.time_label.config(text=now.strftime("%H:%M:%S"))
        self.date_label.config(text=now.strftime("%d/%m/%Y"))
        self.master.after(1000, self.update_time)  # Actualiza cada segundo

if __name__ == "__main__":
    root = tk.Tk()
    app = HackerConsole(root)
    root.mainloop()
