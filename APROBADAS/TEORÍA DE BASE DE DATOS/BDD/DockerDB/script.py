import psycopg2

# Configuración de tu DB psqlunisys en Docker
config = {
    "dbname": "psqlunisys",
    "user": "root",     # Cambiar por tu usuario
    "password": "adminadmin", # Cambiar por tu contraseña
    "host": "localhost",
    "port": "5432" 
}

ESQUEMA = "employees" # <-- IMPORTANTE: Poner el nombre real acá

# Tus 6 consultas exactas del archivo db.txt
consultas = [
    """SELECT d.dept_name FROM department d;""",
    
    """SELECT COUNT (*) FROM employee e;""",
    
    """SELECT AVG (s.amount) FROM salary s WHERE s.to_date = '9999-01-01';""",
    
    """SELECT d.dept_name, MIN (s.amount) AS salario_minimo 
       FROM salary s 
       JOIN employee e ON e.id = s.employee_id 
       JOIN department_employee de ON de.employee_id = e.id 
       JOIN department d ON de.department_id = d.id
       WHERE s.to_date = '9999-01-01'
       GROUP BY d.dept_name;""",
       
    """SELECT d.dept_name, MAX (s.amount) AS salario_maximo 
       FROM salary s 
       JOIN employee e ON e.id = s.employee_id 
       JOIN department_employee de ON de.employee_id = e.id 
       JOIN department d ON de.department_id = d.id
       WHERE s.to_date = '9999-01-01'
       GROUP BY d.dept_name;""",
       
    """SELECT d.dept_name, COUNT (e.id) 
       FROM employee e 
       JOIN department_employee de ON e.id = de.employee_id 
       JOIN department d ON de.department_id = d.id 
       GROUP BY d.dept_name;""",
       
    # A esta le corregí el alias del GROUP BY que te daba error de sintaxis antes
    """SELECT sub.dept_name, COUNT (sub.id) 
       FROM (
           SELECT d.dept_name, e.id 
           FROM employee e 
           JOIN department_employee de ON e.id = de.employee_id 
           JOIN department d ON de.department_id = d.id 
           WHERE d.dept_name = 'Marketing'
       ) AS sub 
       GROUP BY sub.dept_name;"""
]

def main():
    conn = None
    try:
        print("Conectando a PostgreSQL en Docker...")
        conn = psycopg2.connect(**config)
        cursor = conn.cursor()
        
        # Seteamos el esquema
        cursor.execute(f"SET search_path TO {ESQUEMA};")
        
        for i, sql in enumerate(consultas):
            print(f"\n" + "="*50)
            print(f"[{i+1}] Ejecutando consulta:")
            print(f"{sql.strip()}")
            print("-" * 50)
            
            cursor.execute(sql)
            
            # Recuperamos los nombres de las columnas
            colnames = [desc[0] for desc in cursor.description]
            print(" | ".join(colnames))
            print("-" * len(" | ".join(colnames)))
            
            # Imprimimos fila por fila
            filas = cursor.fetchall()
            if not filas:
                print("(Sin resultados)")
            else:
                for fila in filas:
                    # Formateamos cada valor como string para evitar errores con números/fechas
                    print(" | ".join(str(valor) for valor in fila))

        conn.commit()
        print("\n" + "="*50)
        print("¡Todas las consultas finalizaron con éxito!")

    except psycopg2.Error as e:
        print(f"\n[ERROR DE BASE DE DATOS]: {e}")
        if conn: conn.rollback()
    except Exception as e:
        print(f"\n[ERROR EN EL SCRIPT]: {e}")
    finally:
        if 'cursor' in locals() and cursor: cursor.close()
        if conn: conn.close()

if __name__ == "__main__":
    main()