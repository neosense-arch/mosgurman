<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 11.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Catalog;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class ItemSettingsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('brief', 'textarea', array(
                'label'    => 'Описание',
                'required' => false,
            ))
            ->add('price', 'integer', array(
                'label'    => 'Стоимость',
                'required' => false,
            ))
            ->add('photos', 'ns_multi_image', array(
                'label'    => 'Фото',
                'required' => false
            ))
            ->add('prices', 'ns_catalog_table', array(
                'label'    => 'Торговые предложения',
                'required' => false,
                'type'     => 'sellOffer',
                'rows'     => array('weight', 'price'),
            ))
        ;
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Mosgurman\FrontBundle\Catalog\ItemSettingsModel'
        ));
    }

    /**
     * Returns the name of this type.
     *
     * @return string The name of this type
     */
    public function getName()
    {
        return 'mg_front_catalog_item_settings_type';
    }
}