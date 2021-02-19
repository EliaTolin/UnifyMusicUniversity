
--Ascolti totali di tutti gli artisti";
select nome_arte as Artista, count(ora_ascolto) as ascoltiTotali
from riproduzione, brano, utente
where riproduzione.id_brano = brano.id_brano
	and brano.id_utente = utente.id_utente
group by nome_arte;


/*Mostrare il nome di tutti i follower di un artista
select ut.nome, ut.cognome
from utente as ut, segue, utente as art
where ut.id_utente = segue.id_follower
		and segue.id_following = art.id_utente
		and art.nome_arte = 'Fabrizio De André';	
*/

/* tutte le canzoni con chi le ha fatte */
select titolo as Titolo, nome_arte as Artista
from Utente,Brano
where brano.id_utente = utente.id_utente
order by nome_arte;

/*Mostra titoli e ora di ascolto di un utente*/
Select nome as Nome, cognome as Cognome, ora_ascolto as Ora, titolo as Titolo
from utente, riproduzione, brano
where utente.id_utente = riproduzione.id_utente
	and riproduzione.id_brano = brano.id_brano
	and utente.nome = 'Alberto'
	and utente.cognome = 'Stefani';

--Titoli e ora di ascolto di ogni utente
Select nome as Nome, cognome as Cognome, ora_ascolto as Ora, titolo as Titolo
from utente, riproduzione, brano
where utente.id_utente = riproduzione.id_utente
	and riproduzione.id_brano = brano.id_brano
order by cognome;

/*elenco di tutte le canzoni esistenti, con album in cui sono e artista*/
select  brano.titolo as Titolo, utente.nome_arte as Artista, album.titolo as TitoloAlbum 
from utente, composizione, album, contieneAlbum, brano
where utente.id_utente = composizione.id_utente
	and composizione.id_album = album.id_album
	and album.id_album = contieneAlbum.id_album
	and contieneAlbum.id_brano = brano.id_brano;

/*Mostra tutti i dettagli di ogni album presente*/
select album.titolo as TitoloAlbum, nome_arte as artista, count(brano.id_brano) as NumeroBrani, SUM(brano.durata) as DurataTotale
from album, contieneAlbum, brano, composizione, utente
where album.id_album = contieneAlbum.id_album 
	and contieneAlbum.id_brano = brano.id_brano
	and album.id_album = composizione.id_album
	and composizione.id_utente = utente.id_utente
group by album.titolo, artista;

/*Mostrare tutti i concerti in una certa città*/
select concerto.giorno_ora as Giorno, nome_arte as Artista
from concerto, pianificazione, utente
where concerto.giorno_ora = pianificazione.giorno_ora
	and pianificazione.id_utente = utente.id_utente
	and concerto.luogo = 'Bologna';