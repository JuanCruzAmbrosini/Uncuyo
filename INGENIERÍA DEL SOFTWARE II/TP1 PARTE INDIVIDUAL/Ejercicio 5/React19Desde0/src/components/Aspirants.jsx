import foto1 from '../assets/img/foto1.jpg'
import foto2 from '../assets/img/foto2.jpg'
import foto3 from '../assets/img/foto3.jpg'
import foto4 from '../assets/img/foto4.jpg'
import foto5 from '../assets/img/foto5.jpg'
import foto6 from '../assets/img/foto6.jpg'

const aspirants = [
  { name: 'Rocio Carle', position: 'Profesor', image: foto1, alt: 'Rocio' },
  { name: 'Daniel Fuentes', position: 'Técnico de sonido', image: foto2, alt: 'John Wick' },
  { name: 'Lee Chim', position: 'Linguista', image: foto3, alt: 'Lee Chim' },
  { name: 'Gloria Medina', position: 'Administrador', image: foto4, alt: 'Gloria' },
  { name: 'Victor Fuentes', position: 'Computista', image: foto5, alt: 'Victor' },
  { name: 'Luis Fuentes', position: 'Economista', image: foto6, alt: 'Luis' },
]

function AspirantCard({ name, position, image, alt }) {
  return (
    <div className="person-box shadow p-3 mb-5 bg-body-tertiary rounded">
      <div className="box-avatar">
        <img src={image} alt={alt} />
      </div>
      <div className="box-bio">
        <h2 className="bio-name">{name}</h2>
        <p className="bio-position">{position}</p>
      </div>
      <div className="box-actions">
        <button type="button" aria-label={`Agregar ${name} a favoritos`}>
          <i className="bi bi-star" />
        </button>
        <button type="button" aria-label={`Contactar a ${name}`}>
          <i className="bi bi-chat" />
        </button>
        <button type="button" aria-label={`Enviar correo a ${name}`}>
          <i className="bi bi-envelope" />
        </button>
      </div>
    </div>
  )
}

function Aspirants() {
  return (
    <section className="content-wrap">
      <h2>Aspirantes</h2>
      <article className="person-boxes">
        {aspirants.map((aspirant) => (
          <AspirantCard key={aspirant.name} {...aspirant} />
        ))}
      </article>
    </section>
  )
}

export default Aspirants
