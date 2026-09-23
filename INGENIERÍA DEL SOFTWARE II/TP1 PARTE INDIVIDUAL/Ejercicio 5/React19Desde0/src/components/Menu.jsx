import logo from '../assets/img/logo.png'
import { Link, Route, Routes } from 'react-router-dom'
import Aspirants from './Aspirants.jsx'
import Content from './Content.jsx'
import Presale from './Presale.jsx'
import Professions from './Professions.jsx'

function menu() {

    const professions = [
        { id: 1, name: 'Ingeniería de Software' },
        { id: 2, name: 'Diseño Gráfico' },
        { id: 3, name: 'Marketing Digital' },
        { id: 4, name: 'Administración de Empresas' },
        { id: 5, name: 'Contabilidad y Finanzas' },
        { id: 6, name: 'Recursos Humanos' },
        { id: 7, name: 'Ventas y Negocios' },
        { id: 8, name: 'Atención al Cliente' },
        { id: 9, name: 'Logística y Transporte' },
        { id: 10, name: 'Producción y Manufactura' }
    ]

    return (
        <>
            <header className="menu-wrap">
                <figure className="user">
                    <div className="user-avatar">
                        <Link to="/">
                            <img className="w-100" src={logo} alt="Cedavilu Web Academy"/>
                        </Link>
                    </div>
                    <figcaption>
                        Cedavilu Web Academy
                    </figcaption>
                </figure>
                <nav>
                    <section className="menu">
                        <h3>Opciones</h3>
                        <ul>
                            <li>
                                <Link to="/empresas">
                                    <i className="bi bi-building" style={{ fontSize: "1.2rem", color: "cornflowerblue" }}></i>
                                    - Empresas
                                </Link>
                            </li>
                            <li>
                                <Link to="/aspirantes">
                                    <i className="bi bi-person" style={{ fontSize: "1.2rem", color: "cornflowerblue" }}></i>
                                    - Aspirantes
                                </Link>
                            </li>
                            <li>
                                <Link to="/profesiones">
                                    <i className="bi bi-list-check" style={{ fontSize: "1.2rem", color: "cornflowerblue" }}></i>
                                    - Profesiones
                                </Link>
                            </li>
                            <li>
                                <a href="#">
                                    <i className="bi bi-person-vcard" style={{ fontSize: "1.2rem", color: "cornflowerblue" }}></i>
                                    - Postulate aquí
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i className="bi bi-chat-left-text"></i>
                                    - Contacto
                                </a>
                            </li>
                        </ul>
                    </section>
                </nav>
            </header>
            <Routes>
                <Route path="/" element={<Content />} />
                <Route path="/empresas" element={<Presale />} />
                <Route path="/aspirantes" element={<Aspirants />} />
                <Route path="/profesiones" element={<Professions  professions={professions}/>} />
            </Routes>
        </>
    )
}

export default menu