import { useState } from "react"
import { useEffect } from "react"
import React from 'react'
import { Link } from "react-router-dom"
import { collection, getDocs, getDoc, deleteDoc, doc} from "firebase/firestore"
import { db } from "../firebaseConfig/firebase"
import Swal from "sweetalert2"
import withReactContent from "sweetalert2-react-content"

const MySwal = withReactContent(Swal)

const Show = () => {

    // 1_ Configuramos los hooks
    const [products, setProducts] = useState ([])

    //2_ Referenciamos a la db firestore
    const productCollection = collection(db, "products") 

    //3_ Función para mostrar TODOS los docs
    const getProducts = async () => {
    const data = await getDocs(productCollection)
    const items = data.docs.map((doc) => ({...doc.data(), id: doc.id}))
    //console.log(items)
    setProducts(items)
    }

    //4_ Función para eliminar un doc
    const deleteProduct = async (id) => {
        const productDoc = doc(db, "products", id)
        await deleteDoc(productDoc)
        getProducts()
    }


    //5_ Función de confirmación de sweetAlert2

    const confirmDelete = (id) => {
        MySwal.fire({
            title: 'Remove the product?',
            text: "You won't be able to undo this action!",
            icon: 'warning',
            showCancelButton: true,
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!',
            confirmButtonColor: '#d33'
        }).then((result) => {
            if (result.isConfirmed){
                deleteProduct(id)
                Swal.fire(
                    'Deleted!',
                    'Your file has been deleted!',
                    'success'
                )
            }
        })
    }

    //6_ Usamos useEffect
    useEffect (()=>{

        getProducts()

    }, [])

    //7_ Devolvemos vista de nuestro componente



  return (
    <>
        <div className="container" >
            <div className="row">
                <div className="col">
                    <div className="d-grid gap-2">
                        <Link to="/create" className="btn btn-secondary mt-2 mb-2" >Create</Link>
                    </div>

                    <table className="table table-dark table-hover">
                        <thead>
                            <tr>
                                <th>Descirption</th>
                                <th>Stock</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            { products.map((product) => (
                                <tr key={product.id}>
                                    <td>{product.description}</td>
                                    <td>{product.stock}</td>
                                    <td>
                                        <Link to={`/edit/${product.id}`} className="btn btn-light"><i className="fa-solid fa-pen-to-square"></i></Link>
                                        <button onClick={() => confirmDelete(product.id)} className="btn btn-danger" ><i className="fa-solid fa-trash"></i></button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>  
    </>
  )
}

export default Show
