import pandas as pd
from sqlalchemy import create_engine, text

# 1. Configuración de conexión con SQLAlchemy (usa psycopg v3)
# Formato: postgresql+psycopg://usuario:password@host:puerto/base_de_datos
URL_CONEXION = "postgresql+psycopg://root:adminadmin@localhost:5432/psqlunisys"

ESQUEMA = "employees"

# 2. Convertimos tu lista en un diccionario para nombrar las pestañas de Excel
consultas = {
    "Departamentos": """SELECT d.dept_name FROM department d;""",
    
    "Total_Empleados": """SELECT COUNT (*) AS total FROM employee e;""",
    
    "Promedio_Salario": """SELECT AVG (s.amount) AS promedio FROM salary s WHERE s.to_date = '9999-01-01';""",
    
    "Minimo_por_Depto": """
        SELECT d.dept_name, MIN (s.amount) AS salario_minimo 
        FROM salary s 
        JOIN employee e ON e.id = s.employee_id 
        JOIN department_employee de ON de.employee_id = e.id 
        JOIN department d ON de.department_id = d.id
        WHERE s.to_date = '9999-01-01'
        GROUP BY d.dept_name;
    """,
    
    "Maximo_por_Depto": """
        SELECT d.dept_name, MAX (s.amount) AS salario_maximo 
        FROM salary s 
        JOIN employee e ON e.id = s.employee_id 
        JOIN department_employee de ON de.employee_id = e.id 
        JOIN department d ON de.department_id = d.id
        WHERE s.to_date = '9999-01-01'
        GROUP BY d.dept_name;
    """,
    
    "Empleados_por_Depto": """
        SELECT d.dept_name, COUNT (e.id) AS total_empleados
        FROM employee e 
        JOIN department_employee de ON e.id = de.employee_id 
        JOIN department d ON de.department_id = d.id 
        GROUP BY d.dept_name;
    """,
    
    "Marketing_Total": """
        SELECT sub.dept_name, COUNT (sub.id) AS total_marketing
        FROM (
            SELECT d.dept_name, e.id 
            FROM employee e 
            JOIN department_employee de ON e.id = de.employee_id 
            JOIN department d ON de.department_id = d.id 
            WHERE d.dept_name = 'Marketing'
        ) AS sub 
        GROUP BY sub.dept_name;
    """
}

def main():
    print("Conectando a PostgreSQL en Docker y procesando datos...")
    
    try:
        # Creamos el motor de conexión
        engine = create_engine(URL_CONEXION)
        
        # Abrimos un "ExcelWriter" para guardar múltiples pestañas
        with pd.ExcelWriter('reporte_unisys.xlsx', engine='openpyxl') as writer:
            
            # Abrimos la conexión
            with engine.connect() as conn:
                # Seteamos el esquema para esta conexión
                conn.execute(text(f"SET search_path TO {ESQUEMA}"))
                
                # Recorremos cada consulta y generamos la hoja
                for nombre_hoja, query in consultas.items():
                    print(f"Exportando pestaña: {nombre_hoja}...")
                    
                    # Pandas ejecuta la consulta y la convierte en una tabla
                    df = pd.read_sql(text(query), conn)
                    
                    # Guardamos esa tabla en su respectiva pestaña
                    df.to_excel(writer, sheet_name=nombre_hoja, index=False)
                    
        print("\n" + "="*50)
        print("¡Listo! Se ha generado el archivo 'reporte_unisys.xlsx'.")
        
    except Exception as e:
        print(f"\n[ERROR EN EL SCRIPT]: {e}")

if __name__ == "__main__":
    main()