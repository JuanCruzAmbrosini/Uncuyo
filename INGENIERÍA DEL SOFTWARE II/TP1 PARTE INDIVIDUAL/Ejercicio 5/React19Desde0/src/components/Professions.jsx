function Professions({ professionList = []}) {
  return (
    <section className="content-wrap">
      <h2 className="mt-3">Profesiones</h2>
      <div className="list-group shadow-sm p-3 mb-5 rounded">
        <h4 className="list-group-item list-group-item-action active text-center" aria-current="true">
          Listado de Profesiones
        </h4>
        
        {professionList.length === 0 ? (
          <p className="p-3 text-center mb-0">No hay profesiones disponibles.</p>
        ) : (
          professionList.map((profession) => (
            <button 
              key={profession.id} 
              type="button" 
              className="list-group-item list-group-item-action text-center"
            >
              {profession.name}
            </button>
          ))
        )}
      </div>
    </section>
  );
}

export default Professions;
