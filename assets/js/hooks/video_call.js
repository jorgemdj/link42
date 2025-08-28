let VideoCall = {
  mounted() {
    console.log("VideoCall hook montado");

    this.el.addEventListener("click", async () => {
      console.log("Iniciando chamada...");

      // 1. Capturar câmera/microfone
      const stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
      document.querySelector("#localVideo").srcObject = stream;

      // 2. Criar RTCPeerConnection local
      const pc1 = new RTCPeerConnection();
      const pc2 = new RTCPeerConnection();

      // 3. DataChannel para troca de mensagens
      const channel = pc1.createDataChannel("chat");
      channel.onopen = () => channel.send("Olá do pc1!");
      channel.onmessage = (e) => console.log("pc1 recebeu:", e.data);

      pc2.ondatachannel = (event) => {
        event.channel.onmessage = (e) => console.log("pc2 recebeu:", e.data);
      };

      // 4. Áudio/vídeo tracks
      stream.getTracks().forEach(track => pc1.addTrack(track, stream));
      pc2.ontrack = (event) => {
        document.querySelector("#remoteVideo").srcObject = event.streams[0];
      };

      // 5. ICE candidates
      pc1.onicecandidate = (e) => e.candidate && pc2.addIceCandidate(e.candidate);
      pc2.onicecandidate = (e) => e.candidate && pc1.addIceCandidate(e.candidate);

      // 6. Oferta/resposta
      const offer = await pc1.createOffer();
      await pc1.setLocalDescription(offer);
      await pc2.setRemoteDescription(offer);

      const answer = await pc2.createAnswer();
      await pc2.setLocalDescription(answer);
      await pc1.setRemoteDescription(answer);

      console.log("Conexão local estabelecida (loopback)");
    });
  }
};

export default VideoCall;
