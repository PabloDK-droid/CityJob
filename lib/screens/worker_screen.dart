import 'package:flutter/material.dart';

class WorkerScreen extends StatelessWidget {
  const WorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Widget content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Panel Trabajador', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colors.primary)),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                const Icon(Icons.verified_user, size: 36),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Tu perfil está visible'), SizedBox(height: 6), Text('Completa tu información para recibir mejores ofertas.')])),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(spacing: 12, children: [
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.search), label: const Text('Buscar trabajos')),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.upload_file), label: const Text('Subir CV')),
          ]),
          const SizedBox(height: 20),
          const Text('Ofertas relevantes', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  leading: const Icon(Icons.work_outline),
                  title: Text('Oferta ${i + 1}'),
                  subtitle: const Text('Distancia: 3km • Pago: \$'),
                  trailing: ElevatedButton(onPressed: () {}, child: const Text('Postular')),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Trabajador'), backgroundColor: colors.primary),
      drawer: _buildDrawer(context, colors),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return Row(children: [
            NavigationRail(selectedIndex: 0, onDestinationSelected: (i) {}, labelType: NavigationRailLabelType.all, destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home), label: Text('Inicio')),
              NavigationRailDestination(icon: Icon(Icons.history), label: Text('Historial')),
              NavigationRailDestination(icon: Icon(Icons.account_circle), label: Text('Perfil')),
            ]),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: content),
          ]);
        }

        return content;
      }),
    );
  }

  Drawer _buildDrawer(BuildContext context, ColorScheme colors) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(decoration: BoxDecoration(gradient: LinearGradient(colors: [colors.primary, colors.secondary ?? colors.primary])), child: Align(alignment: Alignment.bottomLeft, child: Text('Trabajador', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
        ListTile(leading: const Icon(Icons.home), title: const Text('Inicio'), onTap: () => Navigator.pop(context)),
        ListTile(leading: const Icon(Icons.work), title: const Text('Mis postulaciones'), onTap: () {}),
        ListTile(leading: const Icon(Icons.settings), title: const Text('Ajustes'), onTap: () {}),
        const Spacer(),
        ListTile(leading: const Icon(Icons.logout), title: const Text('Cerrar sesión'), onTap: () {}),
      ]),
    );
  }
}
