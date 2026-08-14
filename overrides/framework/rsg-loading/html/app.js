const { ref } = Vue

// Customize language for dialog menus and carousels here

const load = Vue.createApp({
  setup () {
    return {
      CarouselText1: 'Voce pode adicionar ou remover itens, veiculos, trabalhos e gangues pela pasta shared.',
      CarouselSubText1: 'Foto capturada por: Markyoo#8068',
      CarouselText2: 'Dados adicionais do jogador podem ser configurados no arquivo player.lua do rsg-core.',
      CarouselSubText2: 'Foto capturada por: ihyajb#9723',
      CarouselText3: 'Os ajustes especificos do servidor podem ser feitos nos arquivos config.lua dos recursos.',
      CarouselSubText3: 'Foto capturada por: FLAPZ[INACTIV]#9925',
      CarouselText4: 'Para obter suporte adicional, entre na comunidade em discord.gg/rsgcore',
      CarouselSubText4: 'Foto capturada por: Robinerino#1312',

      DownloadTitle: 'Baixando arquivos do Fipas Roleplay',
      DownloadDesc: "Aguarde enquanto baixamos os recursos necessarios para jogar no Fipas Roleplay. \n\nQuando o download terminar, voce entrara no servidor e esta tela desaparecera. Nao saia nem desligue o computador. ",

      ConfiguracoesTitle: 'Configuracoes',
      AudioTrackDesc1: 'Quando desativada, a trilha sonora atual sera interrompida.',
      AutoPlayDesc2: 'Quando desativada, as imagens do carrossel permanecerao na ultima exibida.',
      PlayVideoDesc3: 'Quando desativado, o video sera pausado.',

      KeybindTitle: 'Teclas padrao',
      Keybind1: 'Abrir inventario',
      Keybind2: 'Alternar alcance da voz',
      Keybind3: 'Abrir telefone',
      Keybind4: 'Colocar ou retirar cinto',
      Keybind5: 'Abrir menu de interacao',
      Keybind6: 'Menu radial',
      Keybind7: 'Abrir menu da interface',
      Keybind8: 'Falar no radio',
      Keybind9: 'Abrir placar',
      Keybind10: 'Trancas do veiculo',
      Keybind11: 'Ligar ou desligar motor',
      Keybind12: 'Apontar',
      Keybind13: 'Atalhos de slots',
      Keybind14: 'Levantar as maos',
      Keybind15: 'Usar slots de itens',
      Keybind16: 'Controle de velocidade',

      firstap: ref(true),
      secondap: ref(true),
      thirdap: ref(true),
      firstslide: ref(1),
      secondslide: ref('1'),
      thirdslide: ref('5'),
      audioplay: ref(true),
      playvideo: ref(true),
      download: ref(true),
      settings: ref(false),
    }
  }
})

load.use(Quasar, { config: {} })
load.mount('#loading-main')

var audio = document.getElementById("audio");
audio.volume = 0.05;

function audiotoggle() {
    var audio = document.getElementById("audio");
    if (audio.paused) {
        audio.play();
    } else {
        audio.pause();
    }
}

function videotoggle() {
    var video = document.getElementById("video");
    if (video.paused) {
        video.play();
    } else {
        video.pause();
    }
}

let count = 0;
let thisCount = 0;

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },

    initFunctionInvoking(data) {
        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (data.idx / count) * 100 + "%";
    },

    startDataFileEntries(data) {
        count = data.count;
    },

    performMapLoadFunction(data) {
        ++thisCount;

        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (thisCount / count) * 100 + "%";
    },
};

window.addEventListener("message", function (e) {
    (handlers[e.data.eventName] || function () {})(e.data);
});
