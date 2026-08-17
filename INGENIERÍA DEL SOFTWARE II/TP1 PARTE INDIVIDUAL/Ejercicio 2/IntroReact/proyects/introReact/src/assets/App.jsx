import './App.css';
import { TwitterFollowCard } from './TwitterFollowCard';

export function App() {
    
    return( 
        <section className='App'>
            <TwitterFollowCard userName = "KazamaAlezn">
                Jovani Vazquez
            </TwitterFollowCard>
            <TwitterFollowCard userName = "Messi">
                Leonel Andrés Messi
            </TwitterFollowCard> 
            <TwitterFollowCard userName = "Cabez">
                Cabezon Gutierrez
            </TwitterFollowCard>
            <TwitterFollowCard userName = "JuanCruzAmbrosini">
                Juan Cruz Ambrosini
            </TwitterFollowCard>
        </section>
    )
}