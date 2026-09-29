import { useState } from "react"

export function TwitterFollowCard({ children, userName = "Unknown" }){

    const [isFollowing, setIsFollowing] = useState(false)

    const text = isFollowing? 'Siguiendo' : 'Seguir'
    const buttonClassName = isFollowing? 'tw-followCard-button is-following' : 'tw-followCard-button'

    const handleClick = () => {
        setIsFollowing(!isFollowing)
    }

    return(
        <article className='tw-followCard'>
            <header className='tw-followCard-header'>
                <img className='tw-followCard-avatar' src={`https://avatars.githubusercontent.com/${userName}`} alt={`Avatar de ${name}`} />
                <div className='tw-followCard-info'>
                    <strong>{children}</strong>
                    <span className='tw-followCard-info-userName'>@{userName}</span>
                </div>
            </header>

            <aside>
                <button className={buttonClassName} onClick={handleClick} >
                    <span className="tw-follow-card-text" >{text}</span>
                    <span className="tw-follow-card-stopFollow" >Dejar de seguir</span>
                </button>
            </aside>
        </article>
    )
}