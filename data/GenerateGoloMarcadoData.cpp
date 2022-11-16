#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <sstream>
#include <map>

using namespace std;

vector<string> teamToPlayers(string teamName){
    map<string, vector<string>> teamPlayersMap {{ "Sporting", {"16","17","18","19","20","21","22","23","24","25","26","27","28"}},
                                            {"Eléctrico",{"31","32","33","34","35","36","38","39","40","41","42"}},
                                            {"Benfica",{"61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76"}},
                                            {"Viseu 2001/Palácio do Gelo",{"129","130","131","132","133","134","135","136","137","138","139","140","141","142","143"}},
                                            {"Leões Porto Salvo",{"80","81","82","83","84","85","86","87","88","89","90","91","92","93"}},
                                            {"Quinta dos Lombos",{"97","98","99","100","101","102","103","104","105","106","107","108","109"}},
                                            {"SC Braga/AAUM",{"113","114","115","116","117","118","119","120","121","122","123","124","125","126"}},
                                            {"Modicus Cartest",{"229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247"}},
                                            {"AD Fundão/Hotel Alambique",{"147","148","149","150","151","152","153","154","155","156","157"}},
                                            {"CR Candoso/Natcal",{"178","179","180","181","182","183","184","185","186","187","188","190","191","192"}},
                                            {"Portimonense",{"161","162","163","164","165","166","167","168","169","170","171","172","173"}},
                                            {"FC Azeméis by Noxae",{"197","198","199","200","201","202","203","204","205","206","207","208"}},
                                            {"Torreense",{"252","253","254","255","256","257","258","259","260","261","262","263","264","265","266"}},
                                            {"Nun´Álvares",{"270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288"}}};
    return teamPlayersMap[teamName];

}


class Jogo{
    public:
        Jogo(string idJogo, string EquipaVisitante, string EquipaVisitada, int GolosVisitante, int GolosVisitada){
            this->idJogo = idJogo;
            this->equipaVisitante = EquipaVisitante;
            this->equipaVisitada = EquipaVisitada;
            this->golosVisitante = GolosVisitante;
            this->golosVisitada = GolosVisitada;
        }
        string getEquipaVisitante(){
            return this->equipaVisitante;
        }
        string getEquipaVisitada(){
            return this->equipaVisitada;
        }
        int getGolosVisitante(){
            return this->golosVisitante;
        }
        int getGolosVisitada(){
            return this->golosVisitada;
        }
        string idJogo;
        string equipaVisitante;
        string equipaVisitada;
        int golosVisitante;
        int golosVisitada;
};

class manager{
    public:
    vector<Jogo> jogos;
    void createJogos();
    void createGoloMarcadoCSV();
};
//idJogo,data,equipaVisitada,equipaVisitante,golosMarcadosVisitado,golosMarcadosVisitante,resultado,arbitro,jornada,fasePlayOff,golos
void manager::createJogos() {
    //read Jogos.csv
    fstream file("../Jogos.csv", ios::in);
    file.ignore(1000, '\n');
    if(file.is_open()){
        vector<string> row;
        string line, word;
        while (getline(file, line)) {
            if(line[line.size()-1] == '\r')
                line.resize(line.size()-1);
            row.clear();
            stringstream str(line);
            while(getline(str, word, ',')) //Number of words per line is constant(O(1))
                row.push_back(word);
            //if any leading zeros in GoloVisitada, remove them and converte to int
            string golosVisitante = row[4];
            golosVisitante.erase(0, min(golosVisitante.find_first_not_of('0'), golosVisitante.size()-1));
            string golosVisitada = row[5];
            golosVisitada.erase(0, min(golosVisitada.find_first_not_of('0'), golosVisitada.size()-1));
            int golosVisitado = stoi(golosVisitada);
            int golosVisitantes = stoi(golosVisitante);
            Jogo jogo(row[0],row[3], row[2], golosVisitantes, golosVisitado);
            jogos.push_back(jogo);
        }
    }
    else {
        cout << "Error opening file";
    }
}

//create GoloMarcado.csv with headers idGoal(number i that gets incremented), minute(random number from 0 to 90), idJogador, idJogo
void manager::createGoloMarcadoCSV() {
    ofstream file("../GoloMarcado.csv");
    file << "idGolo,minuto,idJogador,idJogo" << endl;
    int idGolo = 1;
    for(auto jogo : jogos){
        vector<string> playersVisitante = teamToPlayers(jogo.getEquipaVisitante());
        vector<string> playersVisitada = teamToPlayers(jogo.getEquipaVisitada());
        int golosVisitante = jogo.getGolosVisitante();
        int golosVisitada = jogo.getGolosVisitada();

        for(int i = 0; i < golosVisitante; i++){
            if(playersVisitante.size() == 0){
                cout << "No players in team " << jogo.getEquipaVisitante() << endl;
                continue;
            }
            string randomPlayer = playersVisitante[rand() % playersVisitante.size()];

            int randomMinute = rand() % 90;
            file << idGolo << "," << randomMinute << "," << randomPlayer << "," << jogo.idJogo << endl;
            idGolo++;
        }
        for(int i = 0; i < golosVisitada; i++){
            if(playersVisitada.size() == 0){
                cout << "No players in team " << jogo.getEquipaVisitada() << endl;
                continue;
            }
            string randomPlayer = playersVisitada[rand() % playersVisitada.size()];
            int randomMinute = rand() % 90;
            file << idGolo << "," << randomMinute << "," << randomPlayer << "," << jogo.idJogo << endl;
            idGolo++;
        }
    }
}


int main() {
    manager m;
    m.createJogos();
    m.createGoloMarcadoCSV();
}