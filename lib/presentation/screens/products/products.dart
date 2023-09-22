part of 'products_imports.dart';

@RoutePage()
class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late ProductsViewModel productsViewModel;
  @override
  void initState() {
    productsViewModel =
        ProductsViewModel(repository: context.read<Repository>()); //refer 31:16
    productsViewModel.fetchAllProducts();
    // ProductsRepo().getAllProducts(); //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: BlocBuilder<VelocityBloc<ProductsModel>, VelocityState<ProductsModel>>(
            bloc: ProductsViewModel.productsModelBloc,
            builder: (context, state) {
              if (state is VelocityInitialState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is VelocityUpdateState) {
                return ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    var productsData = state.data.title![index];
                    return Card(
                      child: ListTile(
                        leading: "${index + 1}".text.size(16).make(),
                        title: productsData.text.size(16).make(),
                        trailing: const SizedBox(
                          width: 100,
                          child: Row(
                            children: [],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          )
      );
  }
}
